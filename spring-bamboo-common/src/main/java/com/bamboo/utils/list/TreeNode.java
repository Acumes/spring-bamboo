package com.bamboo.utils.list;

/**
 * @author: acumes
 * @create: 2020-01-11 18:14:52
 * @description:
 */
public class TreeNode extends BaseNode {
    private String title;
    private Integer key;
    private Integer value;

    public TreeNode() {
    }

    public String getTitle() {
        return this.title;
    }

    public Integer getKey() {
        return this.key;
    }

    public Integer getValue() {
        return this.value;
    }

    public void setTitle(final String title) {
        this.title = title;
    }

    public void setKey(final Integer key) {
        this.key = key;
    }

    public void setValue(final Integer value) {
        this.value = value;
    }

    public String toString() {
        return "TreeNode(title=" + this.getTitle() + ", key=" + this.getKey() + ", value=" + this.getValue() + ")";
    }


}
