package com.bamboo.utils.list;

/**
 * @author: acumes
 * @create: 2020-01-11 18:22:48
 * @description:
 */
public class ForestNode extends BaseNode {
    private Object content;

    public ForestNode(Integer id, Integer parentId, Object content) {
        this.id = id;
        this.parentId = parentId;
        this.content = content;
    }

    public Object getContent() {
        return this.content;
    }

    public void setContent(final Object content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        ForestNode that = (ForestNode) o;

        return content != null ? content.equals(that.content) : that.content == null;
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (content != null ? content.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ForestNode{" +
                "content=" + content +
                '}';
    }
}
