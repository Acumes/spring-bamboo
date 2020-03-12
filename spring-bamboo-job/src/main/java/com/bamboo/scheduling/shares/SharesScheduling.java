package com.bamboo.scheduling.shares;

import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import com.bamboo.basicinformationtips.entity.BasicInformationTips;
import com.bamboo.basicinformationtips.service.IBasicInformationTipsService;
import com.bamboo.informationhistory.entity.InformationHistory;
import com.bamboo.informationhistory.service.IInformationHistoryService;
import com.bamboo.utils.*;
import io.swagger.models.auth.In;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author: acumes
 * @create: 2020-01-07 23:40:08
 * @description:
 */
@Component
@Slf4j
public class SharesScheduling {

    @Autowired
    private IBasicInformationService basicInformationService;
    @Autowired
    private IInformationHistoryService informationHistoryService;

    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private RedisTemplate<String,String> redisTemplate;
    @Autowired
    private IBasicInformationTipsService basicInformationTipsService;

//    @Scheduled(cron = "0 0 * * * ?") //每小时

    @Scheduled(cron = "0 30 15 * * ? ") // 每分钟
//    @Scheduled(cron = "*/10 * * * * ? ") // 每分钟
    public void test(){
        log.info("=======================================");
        log.info("开始清理为0的数据");
        informationHistoryService.delTurnoverZero();
        //添加一条当前时间的
        redisTemplate.opsForValue().set("targetPriceCron","1");
        redisTemplate.opsForValue().set("targetAmplitudeCron","1");
        List<BasicInformation> basicInformationList = basicInformationService.getCodes();
        List<InformationHistory> informationHistories = new ArrayList<>();
        Date now = new Date();
        for(BasicInformation basicInformation : basicInformationList){
            InformationHistory informationHistory = new InformationHistory();
            informationHistory.setCode(basicInformation.getCode());
            informationHistory.setName(basicInformation.getName());

            informationHistory.setClosingPrice(basicInformation.getCurrentPrice());
            informationHistory.setOpeningPrice(basicInformation.getCurrentPrice());
            informationHistory.setHighestPrice(basicInformation.getCurrentPrice());
            informationHistory.setMinimumPrice(basicInformation.getCurrentPrice());
            informationHistory.setCurrentPrice(basicInformation.getCurrentPrice());
            informationHistory.setYesterdayClosingPrice(basicInformation.getCurrentPrice());

            informationHistory.setRate(BigDecimal.ZERO);
            informationHistory.setCurrentTurnoverAmount(BigDecimal.ZERO);
            informationHistory.setCurrentTransactionNumber(0);
            informationHistory.setTransactionNumber(0);
            informationHistory.setTurnoverAmount(BigDecimal.ZERO);


            informationHistory.setTradingType("1");
            informationHistory.setCreateTime(now);
            informationHistory.setCreateTimeStamp(now.getTime());

            informationHistories.add(informationHistory);
        }

        informationHistoryService.saveBatch(informationHistories);
    }

    /**
     * 目标价
     * @throws ParseException
     */
    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
    public void targetPriceCron() throws ParseException {
        //
        Long timeMillis = System.currentTimeMillis();
        Long startTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 09:27:53").getTime();
        Long endTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 15:10:05").getTime();
        Date now = new Date();
        if(timeMillis.longValue() >startTime.longValue() && timeMillis.longValue()  < endTime){
            List<BasicInformation> priceGtTarget = basicInformationService.getPriceGtTarget();
            if(!CommonUtil.isEmpty(priceGtTarget)){
                //web端可以控制
                String targetPriceKey = redisTemplate.opsForValue().get("targetPriceCron");
                if(CommonUtil.isEmpty(targetPriceKey)){
                    targetPriceKey = "1";
                    redisTemplate.opsForValue().set("targetPriceCron","1");
                }
                long time = System.currentTimeMillis() + 1000*15;
                        //插入记录表
                String type = "1";
                Boolean isShow = insertBasicTips(priceGtTarget,type);
                if(isShow){
                    if(redisUtil.lock("targetPriceCronLock", String.valueOf(time))){
                        CommonUtil.openLiulanqi("http://localhost:9965/bamboo/test/html");
                        redisTemplate.opsForValue().set("targetPriceCron","0");
                    }else{
                        log.info("已经提醒过了");
                    }
                }

            }
        }
    }

    private Boolean insertBasicTips(List<BasicInformation> priceGtTarget, String type) {
        //根据list查询当天记录表是否存在输入,如果存在,则不插入
        Date now = new Date();
        Boolean isShowLiuLanqi = false;
        List<BasicInformationTips> adds = new ArrayList<>();
        List<String> codes = priceGtTarget.stream().map(BasicInformation::getCode).collect(Collectors.toList());
        List<BasicInformationTips> basicInformationTips = basicInformationTipsService.getCodesToday(codes,type,DateUtils.getStringDateShort());
        if(CommonUtil.isEmpty(basicInformationTips)){
            for(BasicInformation basicInformation : priceGtTarget){
                BasicInformationTips tip = new BasicInformationTips();
                BeanUtils.copyProperties(basicInformation,tip);
                tip.setId(null);
                tip.setCreateTime(now);
                tip.setType(type);
                tip.setIsDelete("1");
                adds.add(tip);
            }
        }else{
            for(BasicInformation basicInformation : priceGtTarget){
                boolean isExist = false;
                for(BasicInformationTips basicInformationTip : basicInformationTips){
                    if(basicInformationTip.getCode().equalsIgnoreCase(basicInformation.getCode())){
                        isExist = true;
                    }
                }
                if(!isExist){
                    BasicInformationTips tip = new BasicInformationTips();
                    BeanUtils.copyProperties(basicInformation,tip);
                    tip.setId(null);
                    tip.setCreateTime(now);
                    tip.setType(type);
                    tip.setIsDelete("1");
                    adds.add(tip);
                }
            }
        }
        if(!CommonUtil.isEmpty(adds)){
            isShowLiuLanqi = true;
            basicInformationTipsService.saveBatch(adds);
        }
        return isShowLiuLanqi;
    }

    /**
     * 做T
     * @throws ParseException
     */
    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
    public void targetAmplitudeCron() throws ParseException {
        //
        Long timeMillis = System.currentTimeMillis();
        Long startTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 09:28:53").getTime();
        Long endTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 15:10:05").getTime();
        Date now = new Date();
        if(timeMillis.longValue() >startTime.longValue() && timeMillis.longValue()  < endTime){
            List<BasicInformation> priceGtTarget = basicInformationService.getAmplitudeGtTarget();
            if(!CommonUtil.isEmpty(priceGtTarget)){
                //web端可以控制
                String targetPriceKey = redisTemplate.opsForValue().get("targetAmplitudeCron");
                if(CommonUtil.isEmpty(targetPriceKey)){
                    targetPriceKey = "1";
                    redisTemplate.opsForValue().set("targetAmplitudeCron","1");
                }
                long time = System.currentTimeMillis() + 1000*15;
                //插入记录表
                String type = "2";
                Boolean isShow = insertBasicTips(priceGtTarget,type);
                if(isShow){
                    if(redisUtil.lock("targetAmplitudeCronLock", String.valueOf(time))){
                        CommonUtil.openLiulanqi("http://localhost:9965/bamboo/test/amplitudeHtml");
                        redisTemplate.opsForValue().set("targetPriceCron","0");
                    }else{
                        log.info("已经提醒过了");
                    }
                }
            }
        }
    }

    //计算涨跌停价格
    @Scheduled(cron = "0 30 15 * * ? ") // 每分钟
    public void limitUpAndDownPrice(){
        List<BasicInformation> priceGtTarget = basicInformationService.list();
        for(BasicInformation basicInformation : priceGtTarget){
            BigDecimal limitPrice =  basicInformation.getCurrentPrice().multiply(new BigDecimal(0.1)).setScale(2, BigDecimal.ROUND_HALF_UP);
            basicInformation.setLimitDownPrice(basicInformation.getCurrentPrice().subtract(limitPrice));
            basicInformation.setLimitUpPrice(basicInformation.getCurrentPrice().add(limitPrice));
            basicInformation.setLimitPriceAmplitude(limitPrice);
        }
        basicInformationService.updateBatchById(priceGtTarget);
    }



  public static void main(String[] args) {
//        CommonUtil.openLiulanqi();
    }

}
