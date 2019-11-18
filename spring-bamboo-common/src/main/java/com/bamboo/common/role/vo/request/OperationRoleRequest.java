package com.bamboo.common.role.vo.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author: acumes
 * @create: 2019-11-07 19:24:20
 * @description:
 */
@ApiModel("添加角色请求类")
@Data
public class OperationRoleRequest implements Serializable {
    private static final long serialVersionUID = -8378623851469047107L;
    @ApiModelProperty(value = "主键> 新增不需要传，修改需要传")
    private Integer id;

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
}
