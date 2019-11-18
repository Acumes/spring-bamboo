package com.bamboo.common.login.response;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author: acumes
 * @create: 2019-11-05 11:03:48
 * @description:
 */
@ApiModel(value = "登录响应类")
@Data
public class LoginResponse {
    @ApiModelProperty(value = "token")
    private String token;
}
