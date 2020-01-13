package com.bamboo.utils.list;

import java.util.List;

public interface INode {
    Integer getId();

    Integer getParentId();

    List<INode> getChildren();
}