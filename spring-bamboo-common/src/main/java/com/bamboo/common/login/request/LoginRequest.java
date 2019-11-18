package com.bamboo.common.login.request;

import com.sun.org.apache.bcel.internal.classfile.Code;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @author: acumes
 * @create: 2019-11-05 10:53:05
 * @description:
 */
@ApiModel(value = "用户登录请求类")
@Data
public class LoginRequest {

    @NotBlank(message="账号不能为空")
    @NotNull(message="账号不能为空")
    @ApiModelProperty(value="手机号", required=true)
    private String account;

    @NotBlank(message="密码不能为空")
    @NotNull(message="密码不能为空")
    @ApiModelProperty(value="密码，密码登陆必填")
    private String password;

    @ApiModelProperty(value="验证码必填")
    @NotBlank(message="验证码不能为空")
    @NotNull(message="验证码不能为空")
    private String verificationCode;
}
