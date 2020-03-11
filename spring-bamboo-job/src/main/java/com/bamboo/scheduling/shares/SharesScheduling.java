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
    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
    public void userWithdrawErrorOrFault() throws Exception {
        //
        Long timeMillis = System.currentTimeMillis();
        Long startTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 09:28:53").getTime();
        Long endTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 22:10:05").getTime();
        Date now = new Date();
        if(timeMillis.longValue() >startTime.longValue() && timeMillis.longValue()  < endTime){
            log.info("=====>>>>>开始查  {}", System.currentTimeMillis());
            List<BasicInformation> basicInformationList = basicInformationService.getCodes();
            List<String> codes = basicInformationList.stream().map(BasicInformation::getCode).collect(Collectors.toList());
            List<InformationHistory> histories = informationHistoryService.selectByCodes(codes);
            if(histories.size() < basicInformationList.size()){
                //判断少了哪个,查询出来

            }
            String url = "http://hq.sinajs.cn/list="+codes.stream().collect(Collectors.joining(","));
            String body = HttpClientUtilsSSL.doGetRequest(url,null,null,false);
            String[] split = body.split(";");
            List<InformationHistory> informationHistories = new ArrayList<>();
            List<BasicInformation> basicInformations = new ArrayList<>();
            BasicInformation basicInformation = null;
            for (String s : split){
                InformationHistory informationHistory = null;
                if("\n".equalsIgnoreCase(s)){
                    continue;
                }

                String[] split1 = s.split(",");
                String [] split2 = split1[0].split("=\"");
                String code1 = split2[0].split("_")[2];

                String name = split1[0].split("=\"")[1];
                //昨收
                boolean isExist = false;
                for(BasicInformation basic : basicInformationList){
                    if(basic.getCode().equalsIgnoreCase(code1)){
                        basicInformation = basic;
                    }
                }
                for(InformationHistory history : histories){
                    if(history.getCode().equalsIgnoreCase(code1)){
                        informationHistory = history;
                        isExist = true;
                    }
                }
                if(isExist){
                    //判断交易额是否一样，如果一样 不插入历史表
//                    if(new BigDecimal(split1[9]).compareTo(informationHistory.getTurnoverAmount()) == 0){
//                        continue;
//                    }
                }
                BigDecimal s1 = new BigDecimal(split1[2]);

                //当前
                BigDecimal price = new BigDecimal(split1[3]);

                BigDecimal bili = price.subtract(s1).divide(s1,4,BigDecimal.ROUND_DOWN).multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_DOWN);
                insertHistory(informationHistory,split,code1,split1,now,name,bili,
                        basicInformations,basicInformation,informationHistories);

            }
            if(!CommonUtil.isEmpty(basicInformations)){
                basicInformationService.updateBatchById(basicInformations);
            }
            if(!CommonUtil.isEmpty(informationHistories)){
                informationHistoryService.saveBatch(informationHistories);
            }

        }
    }

    private InformationHistory insertHistory(InformationHistory informationHistory, String[] split, String code1,String [] split1,
                                             Date now,String name,BigDecimal bili,List<BasicInformation> basicInformations,
                                             BasicInformation basicInformation,List<InformationHistory> informationHistories) {
        InformationHistory insertInfo = new InformationHistory();
        BigDecimal currentPrice = new BigDecimal(split1[3]);
        insertInfo.setYesterdayClosingPrice(new BigDecimal(split1[2]));
        insertInfo.setCode(code1);
        insertInfo.setCreateTime(now);
        insertInfo.setName(name);
        insertInfo.setCurrentPrice(currentPrice);
        insertInfo.setOpeningPrice(new BigDecimal(split1[1]));
        insertInfo.setRate(new BigDecimal(bili.toString()));
        basicInformation.setAmplitude(new BigDecimal(bili.toString()));
        insertInfo.setTransactionNumber(new Integer(split1[8]));
        insertInfo.setTurnoverAmount(new BigDecimal(split1[9]));
        insertInfo.setHighestPrice(new BigDecimal(split1[4]));
        insertInfo.setMinimumPrice(new BigDecimal(split1[5]));
        insertInfo.setBuyOne(new BigDecimal(split1[11]));
        insertInfo.setSellOne(new BigDecimal(split1[21]));
        insertInfo.setCreateTimeStamp(now.getTime());
        if(CommonUtil.isEmpty(informationHistory)){
            insertInfo.setCurrentTransactionNumber(insertInfo.getTransactionNumber()/100);
            insertInfo.setCurrentTurnoverAmount(insertInfo.getTurnoverAmount());
            insertInfo.setTradingType("1");
        }else{

            //当前价与买一价对比
            if(informationHistory.getCurrentPrice().compareTo(currentPrice) >= 1){
                insertInfo.setTradingType("1");
            }else{

                if(currentPrice.compareTo(new BigDecimal(split1[21])) >= 0){
                    if(currentPrice.compareTo(informationHistory.getCurrentPrice()) == 0){
                        if(currentPrice.compareTo(new BigDecimal(split1[11])) > 0){
                            insertInfo.setTradingType("1");
                        }else{
                            insertInfo.setTradingType("2");
                        }
                    }else{
                        insertInfo.setTradingType("1");
                    }
                }else{
                    insertInfo.setTradingType("2");
                }
            }

            insertInfo.setCurrentTransactionNumber((insertInfo.getTransactionNumber()-informationHistory.getTransactionNumber())/100);
            insertInfo.setCurrentTurnoverAmount(insertInfo.getTurnoverAmount().subtract(informationHistory.getTurnoverAmount()));
        }
//        if(insertInfo.getCurrentTransactionNumber() > 0){
        informationHistories.add(insertInfo);
//        }
        if(currentPrice.compareTo(basicInformation.getCurrentPrice()) != 0){
            basicInformation.setCurrentPrice(currentPrice);
            basicInformations.add(basicInformation);
        }
        return null;
    }

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
        Long startTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 00:00:53").getTime();
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
        List<BasicInformationTips> basicInformationTips = basicInformationTipsService.getCodesToday(codes,type);
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
