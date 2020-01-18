package com.bamboo.informationhistory.entity;

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
 * 
 * </p>
 *
 * @author acumes
 * @since 2020-01-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bamboo_information_history")
@ApiModel(value="InformationHistory对象", description="")
public class InformationHistory extends Model<InformationHistory> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    @ApiModelProperty(value = "编码")
    private String code;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "开盘价")
    private BigDecimal openingPrice;

    @ApiModelProperty(value = "最高价")
    private BigDecimal highestPrice;
    @ApiModelProperty(value = "最低价")
    private BigDecimal minimumPrice;
    @ApiModelProperty(value = "当前价格")
    private BigDecimal currentPrice;

    @ApiModelProperty(value = "昨收")
    private BigDecimal yesterdayClosingPrice;

    @ApiModelProperty(value = "收盘价")
    private BigDecimal closingPrice;

    @ApiModelProperty(value = "比例")
    private BigDecimal rate;

    @ApiModelProperty(value = "当前成交金额")
    private BigDecimal currentTurnoverAmount;
    @ApiModelProperty(value = "成交金额")
    private BigDecimal turnoverAmount;

    @ApiModelProperty(value = "当前成交数")
    private Integer currentTransactionNumber;
    @ApiModelProperty(value = "成交数")
    private Integer transactionNumber;
    @ApiModelProperty(value = "买卖类型")
    private String tradingType;
    @ApiModelProperty(value = "买一")
    private BigDecimal buyOne;
    @ApiModelProperty(value = "卖一")
    private BigDecimal sellOne;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;
    @ApiModelProperty(value = "创建时间")
    private Long createTimeStamp;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
