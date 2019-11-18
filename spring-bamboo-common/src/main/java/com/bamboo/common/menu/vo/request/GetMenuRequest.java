package com.bamboo.common.menu.vo.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @author: acumes
 * @create: 2019-11-08 18:13:42
 * @description:
 */
@Data
@ApiModel
public class GetMenuRequest {


    @ApiModelProperty(value = "父级菜单")
    private Integer parentId;

    @ApiModelProperty(value = "菜单名称")
    private String name;

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
    @ApiModelProperty(value = "角色Id")
    private Long roleId;


}
