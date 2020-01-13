package com.bamboo.common.menu.vo.response;

import com.bamboo.utils.list.INode;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: acumes
 * @create: 2020-01-13 14:00:10
 * @description:
 */
@Data
public class MenuVoResponse implements INode {
    @ApiModelProperty(value = "主键")
    private Integer id;

    @ApiModelProperty(value = "父级菜单")
    private Integer parentId;

    @ApiModelProperty(value = "菜单编号")
    private String code;

    @ApiModelProperty(value = "菜单名称")
    private String name;
    @ApiModelProperty(value = "菜单名称")
    private String title;

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

    /**
     * 子孙节点
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<INode> children;

    @Override
    public List<INode> getChildren() {
        if (this.children == null) {
            this.children = new ArrayList<>();
        }
        return this.children;
    }
}
