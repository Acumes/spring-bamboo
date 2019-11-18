package com.bamboo.common.user.service.impl;

import com.bamboo.base.BaseService;
import com.bamboo.base.ServiceConfig;
import com.bamboo.common.constant.CodeAndMsgEnum;
import com.bamboo.common.constant.CommonConstant;
import com.bamboo.common.login.request.LoginRequest;
import com.bamboo.common.login.response.LoginResponse;
import com.bamboo.common.user.dao.UserDao;
import com.bamboo.common.user.entity.User;
import com.bamboo.common.user.service.IUserService;
import com.bamboo.exception.ServiceException;
import com.bamboo.utils.CommonUtil;
import com.bamboo.utils.JWTUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author caihf
 * @since 2019-11-04
 */
@Service
public class UserServiceImpl extends BaseService<UserDao, User> implements IUserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RedisTemplate<String,String> redisTemplate;
    @Autowired
    private ServiceConfig serviceConfig;
    @Override
    public LoginResponse login(LoginRequest request) {
        LoginResponse result = new LoginResponse();
        //校验验证码
        String verification = redisTemplate.opsForValue().get(CommonConstant.CAPTCHA +request.getVerificationCode().toLowerCase());
        if(CommonUtil.isEmpty(verification)){
            throw new ServiceException(CodeAndMsgEnum.IMAGE_VERIFICATION_CODE_ERROR.getCode(),CodeAndMsgEnum.IMAGE_VERIFICATION_CODE_ERROR.getMsg());
        }
        User user = this.findBy("account",request.getAccount());
        if(CommonUtil.isEmpty(user)){
            throw new ServiceException(CodeAndMsgEnum.ACCOUNT_NOT_EXIST_ERROR.getCode(),CodeAndMsgEnum.ACCOUNT_NOT_EXIST_ERROR.getMsg());
        }
        //校验密码
        String password = DigestUtils.md5Hex(request.getPassword() + user.getSalt());
        if(!password.equalsIgnoreCase(user.getPassword())){
            throw new ServiceException(CodeAndMsgEnum.ACCOUNT_PASSWORD_ERROR.getCode(),CodeAndMsgEnum.ACCOUNT_PASSWORD_ERROR.getMsg());
        }
        redisTemplate.delete(CommonConstant.CAPTCHA +request.getVerificationCode().toLowerCase());
        String token = generateToken(user);
        result.setToken(token);
        return result;
    }

    private String generateToken(User user) {
        if (null == user)
            return null;
        Map<String, Object> claims = new HashMap<String, Object>();
        claims.put("userId", user.getId());
        claims.put("userName", user.getName());
        claims.put("roleId", user.getRoleId());
        claims.put("mobile", user.getMobile());
        claims.put("account", user.getAccount());
        String jwt = JWTUtil.createJWT(user.getId(), claims, Long.valueOf(serviceConfig.getJwtExpiration()), serviceConfig.getJwtSigningKey());
        return jwt;
    }
}
