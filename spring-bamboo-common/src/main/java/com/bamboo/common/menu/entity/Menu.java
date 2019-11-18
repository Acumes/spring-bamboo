package com.bamboo.common.menu.entity;

import com.bamboo.base.BaseEntity;
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
 * 菜单表
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bamboo_menu")
@ApiModel(value="Menu对象", description="菜单表")
public class Menu extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "父级菜单")
    private Integer parentId;

    @ApiModelProperty(value = "菜单编号")
    private String code;

    @ApiModelProperty(value = "菜单名称")
    private String name;

    @ApiModelProperty(value = "菜单别名")
    private String alias;

    @ApiModelProperty(value = "请求地址")
    private String path;

    @ApiModelProperty(value = "菜单资源")
    private String source;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "菜单类型")
    private Integer category;

    @ApiModelProperty(value = "操作按钮类型")
    private Integer action;

    @ApiModelProperty(value = "是否打开新页面")
    private Integer isOpen;

    @ApiModelProperty(value = "备注")
    private String remark;

    @Override
    protected Serializable pkVal() {
        return super.getId();
    }

}
