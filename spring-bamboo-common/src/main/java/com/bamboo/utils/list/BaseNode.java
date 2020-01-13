package com.bamboo.utils.list;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: acumes
 * @create: 2020-01-11 18:14:32
 * @description:
 */
public class BaseNode implements INode {
    protected Integer id;
    protected Integer parentId;
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    protected List<INode> children = new ArrayList();

    public BaseNode() {
    }

    public Integer getId() {
        return this.id;
    }

    public Integer getParentId() {
        return this.parentId;
    }

    public List<INode> getChildren() {
        return this.children;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public void setParentId(final Integer parentId) {
        this.parentId = parentId;
    }

    public void setChildren(final List<INode> children) {
        this.children = children;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof BaseNode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BaseNode baseNode = (BaseNode) o;

        if (id != null ? !id.equals(baseNode.id) : baseNode.id != null) return false;
        if (parentId != null ? !parentId.equals(baseNode.parentId) : baseNode.parentId != null) return false;
        return children != null ? children.equals(baseNode.children) : baseNode.children == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (parentId != null ? parentId.hashCode() : 0);
        result = 31 * result + (children != null ? children.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "BaseNode{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", children=" + children +
                '}';
    }
}

