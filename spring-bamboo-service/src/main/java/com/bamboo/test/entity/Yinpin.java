package com.bamboo.test.entity;

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
 * @since 2020-01-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Yinpin对象", description="")
public class Yinpin extends Model<Yinpin> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "文件名")
    private String fileName;

    @ApiModelProperty(value = "大小")
    private String size;

    @ApiModelProperty(value = "状态")
    private String status;

    @ApiModelProperty(value = "成功url")
    private String successUrl;

    @ApiModelProperty(value = "失败原因")
    private String faultRemark;
    @ApiModelProperty(value = "失败原因")
    private String file;

    @ApiModelProperty(value = "上传时间")
    private Date time;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
