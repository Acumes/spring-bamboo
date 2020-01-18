package com.bamboo.scheduling.shares;

import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import com.bamboo.informationhistory.entity.InformationHistory;
import com.bamboo.informationhistory.service.IInformationHistoryService;
import com.bamboo.utils.*;
import io.swagger.models.auth.In;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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

//    @Scheduled(cron = "0 0 * * * ?") //每小时
    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
    public void userWithdrawErrorOrFault() throws Exception {
        //
        Long timeMillis = System.currentTimeMillis();
        Long startTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 09:29:53").getTime();
        Long endTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 23:59:05").getTime();
        Date now = new Date();
        if(timeMillis.longValue() >startTime.longValue() && timeMillis.longValue()  < endTime){
            log.info("=====>>>>>开始查  {}", System.currentTimeMillis());
            List<BasicInformation> basicInformationList = basicInformationService.getCodes();
            List<String> codes = basicInformationList.stream().map(BasicInformation::getCode).collect(Collectors.toList());
            List<InformationHistory> histories = informationHistoryService.selectByCodes(codes);
            String url = "http://hq.sinajs.cn/list="+codes.stream().collect(Collectors.joining(","));;

            String body = HttpClientUtilsSSL.doGetRequest(url,null,null,false);
            String[] split = body.split(";");
            List<InformationHistory> informationHistories = new ArrayList<>();
            List<BasicInformation> basicInformations = new ArrayList<>();
            InformationHistory informationHistory = null;
            BasicInformation basicInformation = null;
            for (String s : split){
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
        if(insertInfo.getCurrentTransactionNumber() > 0){
            informationHistories.add(insertInfo);
        }
        if(currentPrice.compareTo(basicInformation.getCurrentPrice()) != 0){
            basicInformation.setCurrentPrice(currentPrice);
            basicInformations.add(basicInformation);
        }
        return null;
    }

}
