package com.bamboo.coininfo.entity.vo;

import lombok.Data;

import java.util.List;

/**
 * @author: acumes
 * @create: 2020-03-13 16:44:48
 * @description:
 */
@Data
public class CoinSyncMergedDto {

    /**
     * status : ok
     * ch : market.btcusdt.detail.merged
     * ts : 1584089056127
     * tick : {"amount":386266.5027626389,"open":7401.62,"close":5267.08,"high":7412.36,"id":210298428418,"count":1912275,"low":3800,"version":210298428418,"ask":[5267.08,0.003301173160460825],"vol":2.0974948582834046E9,"bid":[5267.07,2]}
     */

    private String status;
    private String ch;
    private long ts;
    private TickBean tick;



    @Data
    public static class TickBean {
        /**
         * amount : 386266.5027626389
         * open : 7401.62
         * close : 5267.08
         * high : 7412.36
         * id : 210298428418
         * count : 1912275
         * low : 3800.0
         * version : 210298428418
         * ask : [5267.08,0.003301173160460825]
         * vol : 2.0974948582834046E9
         * bid : [5267.07,2]
         */

        private double amount;
        private double open;
        private double close;
        private double high;
        private long id;
        private int count;
        private double low;
        private long version;
        private double vol;
        private List<Double> ask;
        private List<Double> bid;
    }
}
