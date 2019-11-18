package com.bamboo.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("分页公共Response")
public class BasePageResponse {
    @ApiModelProperty("页码")
    private Integer pageNo;
    @ApiModelProperty("单页数据大小")
    private Integer pageSize;
    @ApiModelProperty("总数")
    private Long total;
}
