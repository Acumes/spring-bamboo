package com.bamboo.scheduling.shares;

import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import com.bamboo.informationhistory.entity.InformationHistory;
import com.bamboo.informationhistory.service.IInformationHistoryService;
import com.bamboo.utils.*;
import io.swagger.models.auth.In;
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
        Long endTime = DateUtils.getDateMillisecond(DateUtils.getStringDateShort() + " 15:00:02").getTime();
        if(timeMillis.longValue() >startTime.longValue() && timeMillis.longValue()  < endTime){
            log.info("=====>>>>>开始查  {}", System.currentTimeMillis());
            System.out.println(basicInformationService.getCodes());
            String code = basicInformationService.getCodes();
            String url = "http://hq.sinajs.cn/list="+code;
            String body = HttpClientUtilsSSL.doGetRequest(url,null,null,false);
            String[] split = body.split(";");
            List<InformationHistory> informationHistories = new ArrayList<>();
            List<BasicInformation> basicInformations = new ArrayList<>();
            for (String s : split){
                if("\n".equalsIgnoreCase(s)){
                    continue;
                }
                String[] split1 = s.split(",");
                String [] split2 = split1[0].split("=\"");
                String code1 = split2[0].split("_")[2];
                InformationHistory informationHistory = informationHistoryService.selectByCode(code1);
                BasicInformation basicInformation = basicInformationService.selectByCode(code1);
                String name = split1[0].split("=\"")[1];
                //昨收
                BigDecimal s1 = new BigDecimal(split1[2]);
                InformationHistory insertInfo = new InformationHistory();

                //当前
                BigDecimal price = new BigDecimal(split1[3]);

                BigDecimal bili = price.subtract(s1).divide(s1,4,BigDecimal.ROUND_DOWN).multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_DOWN);
                String color = "";
//            if(bili.compareTo(BigDecimal.ZERO) > 0){
//                color = "\033[31;4m";
//            }else if(bili.compareTo(BigDecimal.ZERO) == 0){
//                color = "\033[30;4m";
//            }else{
//                color = "\033[32;4m";
//            }
                basicInformation.setCurrentPrice(new BigDecimal(split1[3]));

                insertInfo.setYesterdayClosingPrice(new BigDecimal(split1[2]));
                insertInfo.setCode(code1);
                insertInfo.setCreateTime(new Date());
                insertInfo.setName(name);
                insertInfo.setCurrentPrice(new BigDecimal(split1[3]));
                insertInfo.setOpeningPrice(new BigDecimal(split1[1]));
                insertInfo.setRate(new BigDecimal(bili.toString()));
                insertInfo.setTransactionNumber(new Integer(split1[8]));
                insertInfo.setTurnoverAmount(new BigDecimal(split1[9]));
                insertInfo.setHighestPrice(new BigDecimal(split1[4]));
                insertInfo.setMinimumPrice(new BigDecimal(split1[5]));
                if(CommonUtil.isEmpty(informationHistory)){
                    insertInfo.setCurrentTransactionNumber(insertInfo.getTransactionNumber());
                    insertInfo.setCurrentTurnoverAmount(insertInfo.getTurnoverAmount());
                    insertInfo.setTradingType("1");
                }else{

                    //当前价与买一价对比

                    insertInfo.setCurrentTransactionNumber(insertInfo.getTransactionNumber()-informationHistory.getTransactionNumber());
                    insertInfo.setCurrentTurnoverAmount(insertInfo.getTurnoverAmount().subtract(informationHistory.getTurnoverAmount()));
//                    if(insertInfo.getCurrentPrice().compareTo(informationHistory.getCurrentPrice()))
//                insertInfo.setTransactionNumber(new Integer(split1[8])-informationHistory.getTransactionNumber());
//                insertInfo.setTurnoverAmount(new BigDecimal(split1[9]).subtract(informationHistory.getTurnoverAmount()));
                }
                informationHistories.add(insertInfo);
                basicInformations.add(basicInformation);
//            System.out.println(color+ name + " 开盘价：" + split1[1] + " 昨收：" + split1[2] + " 当前价格：" + split1[3]+ " 比例:"+ bili.toString() + "% 今高：" + split1[4] + " 今低："+ split1[5] +
//                    "交易额:" + split1[9]+ "交易数量："+ split1[8]+ "\033[0m");
            }
            basicInformationService.updateBatchById(basicInformations);
            informationHistoryService.saveBatch(informationHistories);
        }
    }

}
