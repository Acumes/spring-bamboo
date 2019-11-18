package com.bamboo.common.role.vo.response;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: acumes
 * @create: 2019-11-13 18:19:00
 * @description:
 */

@ApiModel("permission权限响应类")
@Data
public class PermissionResponse {
    @ApiModelProperty(value = "id")
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

    private List<PermissionResponse> children = new ArrayList<>();
}
