package com.bamboo.basicinformationtips.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

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
 * @since 2020-03-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bamboo_basic_information_tips")
@ApiModel(value="BasicInformationTips对象", description="")
public class BasicInformationTips extends Model<BasicInformationTips> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    @ApiModelProperty(value = "编码")
    private String code;

    @ApiModelProperty(value = "名称")
    private String name;
    @ApiModelProperty(value = "类型: 1.目标价. 2. 做T")
    private String type;

    @ApiModelProperty(value = "当前价格")
    private BigDecimal currentPrice;

    @ApiModelProperty(value = "目标价格")
    private BigDecimal targetPrice;

    @ApiModelProperty(value = "振幅")
    private BigDecimal amplitude;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    private String isDelete;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
