package com.bamboo.common.login;

import com.bamboo.base.BaseResponse;
import com.bamboo.common.login.request.LoginRequest;
import com.bamboo.common.login.response.LoginResponse;
import com.bamboo.common.user.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: acumes
 * @create: 2019-11-05 10:51:46
 * @description:
 */
@RestController
@Api(tags = "登录请求类")
public class LoginController {

    @Autowired
    private IUserService userService;

    @PostMapping("/login")
    @ApiOperation("账号密码登录")
    public BaseResponse<LoginResponse> login(@RequestBody LoginRequest request){
        LoginResponse response = userService.login(request);
        return new BaseResponse<>(response);
    }
    @PostMapping("/smsLogin")
    @ApiOperation("短信验证码登录")
    public BaseResponse<LoginResponse> smsLogin(){

        return null;
    }

}
