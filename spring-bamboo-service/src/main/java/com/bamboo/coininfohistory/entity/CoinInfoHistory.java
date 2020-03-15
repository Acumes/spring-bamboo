package com.bamboo.coininfohistory.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 币种信息历史表
 * </p>
 *
 * @author acumes
 * @since 2020-03-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bamboo_coin_info_history")
@ApiModel(value="CoinInfoHistory对象", description="币种信息历史表")
public class CoinInfoHistory extends Model<CoinInfoHistory> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "币种名称")
    private String coinName;

    @ApiModelProperty(value = "当前价格")
    private BigDecimal currentPrice;

    @ApiModelProperty(value = "目标价格")
    private BigDecimal targetPrice;

    @ApiModelProperty(value = "卖出价")
    private BigDecimal salePrice;

    @ApiModelProperty(value = "交易对")
    private String symbol;

    private Date createTime;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}
