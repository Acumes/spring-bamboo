package com.bamboo.coinsymbol.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 币种交易对
 * </p>
 *
 * @author acumes
 * @since 2020-03-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bamboo_coin_symbol")
@ApiModel(value="CoinSymbol对象", description="币种交易对")
public class CoinSymbol extends Model<CoinSymbol> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    @ApiModelProperty(value = "交易对中的基础币种")
    private String baseCurrency;

    @ApiModelProperty(value = "交易对中的报价币种")
    private String quoteCurrency;

    @ApiModelProperty(value = "交易对报价的精度（小数点后位数）")
    private Integer pricesPrecision;

    @ApiModelProperty(value = "交易对基础币种计数精度（小数点后位数）")
    private Integer amountPrecision;

    @ApiModelProperty(value = "交易区，可能值: [main，innovation]")
    private String symbolPartition;

    @ApiModelProperty(value = "交易对")
    private String symbol;

    @ApiModelProperty(value = "交易对状态；可能值: [online，offline,suspend] online - 已上线；offline - 交易对已下线，不可交易；suspend -- 交易暂停")
    private String state;

    @ApiModelProperty(value = "交易对交易金额的精度（小数点后位数）")
    private Long valuePrecision;

    @ApiModelProperty(value = "交易对最小下单量 (下单量指当订单类型为限价单或sell-market时，下单接口传的)")
    private BigDecimal minOrderAmt;

    @ApiModelProperty(value = "交易对最大下单量")
    private BigDecimal maxOrderAmt;

    @ApiModelProperty(value = "最小下单金额 （下单金额指当订单类型为限价单时，下单接口传入的(amount * price)。当订单类型为buy-market时，下单接口传的）")
    private BigDecimal minOrderValue;

    @ApiModelProperty(value = "交易对杠杆最大倍数")
    private BigDecimal leverageRatio;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
