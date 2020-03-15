package com.bamboo.scheduling.shares;

import com.alibaba.fastjson.JSON;
import com.bamboo.coininfo.entity.CoinInfo;
import com.bamboo.coininfo.entity.vo.CoinSyncDto;
import com.bamboo.coininfo.entity.vo.CoinSyncMergedDto;
import com.bamboo.coininfo.service.ICoinInfoService;
import com.bamboo.coininfohistory.entity.CoinInfoHistory;
import com.bamboo.coininfohistory.service.ICoinInfoHistoryService;
import com.bamboo.coinsymbol.entity.CoinSymbol;
import com.bamboo.coinsymbol.service.ICoinSymbolService;
import com.bamboo.test.HuobiApi;
import com.bamboo.utils.CommonUtil;
import com.bamboo.utils.HttpClientUtilsSSL;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpHost;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: acumes
 * @create: 2020-03-13 14:47:45
 * @description:
 */
@Component
@Slf4j
public class ChainScheduling {



    @Autowired
    private ICoinSymbolService coinSymbolService;
    @Autowired
    private ICoinInfoService coinInfoService;
    @Autowired
    private ICoinInfoHistoryService coinInfoHistoryService;
    @Autowired
    private RedisTemplate<String,String> redisTemplate;

//    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
//    public void test(){
//        String body = HttpClientUtilsSSL.doGetRequest("http://api.huobi.pro/v1/common/symbols",null,null,false);
//        System.out.println(body);
//        HuobiApi resp = JSON.parseObject(body, HuobiApi.class);
//        System.out.println(resp);
//        List<HuobiApi.DataBean> data = resp.getData();
//        List<CoinSymbol> list = coinSymbolService.list();
//        List<CoinSymbol> add = new ArrayList<>();
//        if(CommonUtil.isEmpty(list)){
//            for(HuobiApi.DataBean a : data){
//                CoinSymbol coinSymbol = new CoinSymbol();
//                coinSymbol.setAmountPrecision(a.getAmountprecision());
//                coinSymbol.setBaseCurrency(a.getBasecurrency());
//                coinSymbol.setLeverageRatio(new BigDecimal(a.getLeverageratio()));
//                coinSymbol.setMaxOrderAmt(new BigDecimal(a.getMaxorderamt()));
//                coinSymbol.setMinOrderAmt(new BigDecimal(a.getMinorderamt()));
//                coinSymbol.setMinOrderValue(new BigDecimal(a.getMinordervalue()));
//                coinSymbol.setPricesPrecision(a.getPriceprecision());
//                coinSymbol.setQuoteCurrency(a.getQuotecurrency());
//                coinSymbol.setState(a.getState());
//                coinSymbol.setSymbol(a.getSymbol());
//                coinSymbol.setSymbolPartition(a.getSymbolpartition());
//                coinSymbol.setValuePrecision(Long.valueOf(a.getValueprecision()));
//                add.add(coinSymbol);
//            }
//        }
//        if(!CommonUtil.isEmpty(add)){
//            coinSymbolService.saveBatch(add);
//        }
//
//    }
    @Scheduled(cron = "0/2 * *  * * ? ") // 每分钟
    public void syncCoinInfo(){
        String body = HttpClientUtilsSSL.doGetRequest("http://api.huobi.pro/market/detail/merged?symbol=btcusdt",null,null,false
                ,new HttpHost("127.0.0.1",1080));
        System.out.println(body);
        CoinSyncMergedDto resp = JSON.parseObject(body, CoinSyncMergedDto.class);
        List<CoinInfo> list = coinInfoService.list();
        List<CoinInfoHistory> addHistory = new ArrayList<>();
        for(CoinInfo coinInfo: list){
            CoinInfoHistory coinInfoHistory = new CoinInfoHistory();
            coinInfo.setCurrentPrice(new BigDecimal(resp.getTick().getClose()));
            BeanUtils.copyProperties(coinInfo,coinInfoHistory);
            coinInfoHistory.setCreateTime(new Date());
            addHistory.add(coinInfoHistory);
        }
        coinInfoService.updateBatchById(list);
        coinInfoHistoryService.saveBatch(addHistory);
    }
    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
    public void transBtc(){
        List<CoinInfo> list = coinInfoService.list();
        //web端可以控制
        String targetPriceKey = redisTemplate.opsForValue().get("transBtc");
        if(CommonUtil.isEmpty(targetPriceKey)){
            targetPriceKey = "1";
            redisTemplate.opsForValue().set("transBtc","1");
        }
        if(list.get(0).getCurrentPrice().compareTo(list.get(0).getTargetPrice())<0){
            if("1".equalsIgnoreCase(targetPriceKey)){
                CommonUtil.openLiulanqi("http://localhost:9965/bamboo/test/btcHtml");
                redisTemplate.opsForValue().set("transBtc","0");
            }
        }
    }
    @Scheduled(cron = "0/3 * *  * * ? ") // 每分钟
    public void saleBtc(){
        List<CoinInfo> list = coinInfoService.list();
        //web端可以控制
        String targetPriceKey = redisTemplate.opsForValue().get("saleBtc");
        if(CommonUtil.isEmpty(targetPriceKey)){
            targetPriceKey = "1";
            redisTemplate.opsForValue().set("saleBtc","1");
        }
        if(list.get(0).getCurrentPrice().compareTo(list.get(0).getSalePrice())>0){
            if("1".equalsIgnoreCase(targetPriceKey)){
                CommonUtil.openLiulanqi("http://localhost:9965/bamboo/test/saleBtc");
                redisTemplate.opsForValue().set("saleBtc","0");
            }
        }
    }


    public static void main(String[] args) {
//        String body = HttpClientUtilsSSL.doGetRequest("http://api.huobi.pro/v1/common/symbols",null,null,false,new HttpHost("127.0.0.1",1080));
//        System.out.println(body);
        String body = HttpClientUtilsSSL.doGetRequest("http://api.huobi.pro/market/detail/merged?symbol=btcusdt",null,null,false
                ,new HttpHost("127.0.0.1",1080));
        System.out.println(body);
        CoinSyncMergedDto resp = JSON.parseObject(body, CoinSyncMergedDto.class);
        System.out.println(resp);
    }
}
