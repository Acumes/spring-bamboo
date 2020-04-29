package com.bamboo.limitdowninformation.entity;

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
 * @since 2020-04-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bamboo_limit_down_information")
@ApiModel(value="LimitDownInformation对象", description="")
public class LimitDownInformation extends Model<LimitDownInformation> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    @ApiModelProperty(value = "编码")
    private String code;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "当前价格")
    private BigDecimal currentPrice;

    @ApiModelProperty(value = "振幅")
    private BigDecimal amplitude;

    private String remark;

    private Date createTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
