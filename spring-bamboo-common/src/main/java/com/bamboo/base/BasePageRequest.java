package com.bamboo.base;

import io.swagger.annotations.ApiModelProperty;

public class BasePageRequest {
    @ApiModelProperty(value = "单页数据大小,默认<span style=\"color:red;\">20</span>最大<span style=\"color:red;\">100条</span>")
    private Integer pageSize = 10;
    @ApiModelProperty("页码，默认<span style=\"color:red;\">1</span>")
    private Integer pageNo = 1;

    public Integer getPageSize() {
        //最大页数100条
        if(pageSize <= 0){
            pageSize = 20;
        }else if(pageSize > 100){
            pageSize = 100;
        }
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNo() {
        if(pageNo <= 0){
            pageNo = 1;
        }
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }
}
