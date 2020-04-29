package com.bamboo.scheduling.shares;

import com.alibaba.fastjson.JSON;
import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import com.bamboo.basicinformationtips.service.IBasicInformationTipsService;
import com.bamboo.informationhistory.entity.InformationHistory;
import com.bamboo.informationhistory.service.IInformationHistoryService;
import com.bamboo.limitdowninformation.entity.LimitDownInformation;
import com.bamboo.limitdowninformation.service.ILimitDownInformationService;
import com.bamboo.test.entity.Dietie;
import com.bamboo.utils.CommonUtil;
import com.bamboo.utils.DateUtils;
import com.bamboo.utils.HttpClientUtilsSSL;
import com.bamboo.utils.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author: acumes
 * @create: 2020-03-12 07:43:41
 * @description:
 */
@Component
@Slf4j
public class SyncDataScheduling {
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
    @Autowired
    private ILimitDownInformationService limitDownInformationService;

    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
    public void userWithdrawErrorOrFault() throws Exception {
        //
        Long timeMillis = System.currentTimeMillis();
        Long startTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 09:28:53").getTime();
        Long endTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 15:10:05").getTime();
        Date now = new Date();
        if(timeMillis.longValue() >startTime.longValue() && timeMillis.longValue()  < endTime){
            log.info("=====>>>>>gpSyncDataScheduling开始查  {}", DateUtils.getStringDate());
            long time = System.currentTimeMillis() + 1000*1;
            if(redisUtil.lock("gpSyncDataScheduling", String.valueOf(time))){
                List<BasicInformation> basicInformationList = basicInformationService.getCodes();
                List<String> codes = basicInformationList.stream().map(BasicInformation::getCode).collect(Collectors.toList());
                List<InformationHistory> histories = informationHistoryService.selectByCodes(codes);
                if(histories.size() < basicInformationList.size()){
                    //判断少了哪个,查询出来

                }
                String url = "http://hq.sinajs.cn/list="+codes.stream().collect(Collectors.joining(","));
                String body = HttpClientUtilsSSL.doGetRequest(url,null,null,false,null);
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
            }else{
                log.info("我被锁住了gpSyncDataScheduling"+DateUtils.getStringDate());
            }
        }
    }


    @Scheduled(cron = "0 15 15 * * ?")// 每分钟
//    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
    public void userDieTingGp() throws Exception {

        log.info("=====>>>>>userDieTingGp开始查  {}", DateUtils.getStringDate());
        long time = System.currentTimeMillis() + 1000*1;
        if(redisUtil.lock("userDieTingGp", String.valueOf(time))){
            String url = "http://45.push2.eastmoney.com/api/qt/clist/get?cb=jQuery112405701380065485717_1587607159901&pn=1&pz=400&po=0&np=1&ut=bd1d9ddb04089700cf9c27f6f7426281&fltt=2&invt=2&fid=f3&fs=m:0+t:6,m:0+t:13,m:0+t:80,m:1+t:2,m:1+t:23&fields=f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f12,f13,f14,f15,f16,f17,f18,f20,f21,f23,f24,f25,f22,f11,f62,f128,f136,f115,f152&_="+System.currentTimeMillis();
            String body = HttpClientUtilsSSL.doGetRequest(url,null,null,false,null);
            System.out.println(body);
            StringBuffer sb = new StringBuffer();
            sb.append(body.substring(42,body.length()-2));
            System.out.println(sb);
            Dietie blockHeightDto = JSON.parseObject(sb.toString(), Dietie.class);
            System.out.println(blockHeightDto);
            List<Dietie.DataBean.DiffBean> datas = blockHeightDto.getData().getDiff();
            List<LimitDownInformation> add = new ArrayList<>();
            for(Dietie.DataBean.DiffBean data : datas){
                System.out.println(data);
                LimitDownInformation limitDownInformation = new LimitDownInformation();
                limitDownInformation.setAmplitude(new BigDecimal(data.getF3()));
                limitDownInformation.setCode(data.getF12());
                limitDownInformation.setName(data.getF14());
                limitDownInformation.setCreateTime(new Date());
                BigDecimal a = new BigDecimal(data.getF18()).subtract(new BigDecimal(data.getF2()).setScale(2));
                limitDownInformation.setCurrentPrice(new BigDecimal(data.getF2()));
                limitDownInformation.setRemark("跌了:"+a.toPlainString());
                add.add(limitDownInformation);
            }
            if(!CommonUtil.isEmpty(add)){
                limitDownInformationService.saveBatch(add);
            }
        }else{
            log.info("我被锁住了userDieTingGp"+DateUtils.getStringDate());
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
//        basicInformation.setBuyOne(new BigDecimal(split1[11]));
//        basicInformation.setSellOne(new BigDecimal(split1[21]));
        //判断如果是涨停的话就设置涨停封单数
//        if(basicInformation.getLimitUpPrice().compareTo(currentPrice) == 0){
//            basicInformation.setLimitUpSealingSheet(Long.valueOf(split1[11]));
//        }
//        if(basicInformation.getLimitDownPrice().compareTo(currentPrice) == 0){
//            basicInformation.setLimitDownSealingSheet(Long.valueOf(split1[21]));
//        }
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

}
