package com.bamboo.basicinformation.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
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
 * @since 2020-01-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bamboo_basic_information")
@ApiModel(value="BasicInformation对象", description="")
public class BasicInformation extends Model<BasicInformation> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    @ApiModelProperty(value = "编码")
    private String code;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "当前价格")
    private BigDecimal currentPrice;

    @ApiModelProperty(value = "目标价格")
    private BigDecimal targetPrice;

    @ApiModelProperty(value = "涨跌停价格幅度")
    private BigDecimal limitPriceAmplitude;
    @ApiModelProperty(value = "涨停价")
    private BigDecimal limitUpPrice;
    @ApiModelProperty(value = "涨停封单数")
    private Long limitUpSealingSheet;
    @ApiModelProperty(value = "涨停封单预警数")
    private Long limitUpSealingSheetTip;
    @ApiModelProperty(value = "跌停价")
    private BigDecimal limitDownPrice;
    @ApiModelProperty(value = "跌停封单数")
    private Long limitDownSealingSheet;
    @ApiModelProperty(value = "跌停封单预警数")
    private Long limitDownSealingSheetTip;




    @ApiModelProperty(value = "概念")
    private String concept;
    @ApiModelProperty(value = "振幅")
    private BigDecimal amplitude;
    @ApiModelProperty(value = "备注")
    private String remark;
    @ApiModelProperty(value = "T")
    private String doT;
    @ApiModelProperty(value = "doTAmplitude")
    private BigDecimal doTAmplitude;
    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime = new Date();


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
