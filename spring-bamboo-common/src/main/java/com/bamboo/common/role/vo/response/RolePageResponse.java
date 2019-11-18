package com.bamboo.common.role.vo.response;

import com.bamboo.base.BasePageResponse;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @author: acumes
 * @create: 2019-11-11 14:57:10
 * @description:
 */
@Data
@ApiModel("角色分页响应类")
public class RolePageResponse extends BasePageResponse {
    @ApiModelProperty("data")
    private List<GetRoleResponse> data;
}
