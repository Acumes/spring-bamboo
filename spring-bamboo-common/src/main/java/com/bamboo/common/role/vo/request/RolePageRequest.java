package com.bamboo.common.role.vo.request;

import com.bamboo.base.BasePageRequest;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author: acumes
 * @create: 2019-11-11 14:56:22
 * @description:
 */
@Data
@ApiModel("角色分页请求类")
public class RolePageRequest extends BasePageRequest {
    @ApiModelProperty("名称")
    private String name;
}
