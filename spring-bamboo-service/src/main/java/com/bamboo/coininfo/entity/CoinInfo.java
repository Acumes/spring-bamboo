package com.bamboo.coininfo.entity;

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
 * 币种信息表
 * </p>
 *
 * @author acumes
 * @since 2020-03-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bamboo_coin_info")
@ApiModel(value="CoinInfo对象", description="币种信息表")
public class CoinInfo extends Model<CoinInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    @ApiModelProperty(value = "币种名称")
    private String coinName;
    @ApiModelProperty(value = "交易对")
    private String symbol;

    @ApiModelProperty(value = "当前价格")
    private BigDecimal currentPrice;

    @ApiModelProperty(value = "目标价格")
    private BigDecimal targetPrice;
    @ApiModelProperty(value = "目标价格")
    private BigDecimal salePrice;

    private Date createTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
