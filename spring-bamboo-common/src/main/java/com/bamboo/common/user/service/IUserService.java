package com.bamboo.common.user.service;

import com.bamboo.base.Service;
import com.bamboo.common.login.request.LoginRequest;
import com.bamboo.common.login.response.LoginResponse;
import com.bamboo.common.user.entity.User;

public interface IUserService extends Service<User> {
    /**
     * 密码登录
     * @param request
     * @return
     */
    LoginResponse login(LoginRequest request);
}
