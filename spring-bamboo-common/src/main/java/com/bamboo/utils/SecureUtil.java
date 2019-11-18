package com.bamboo.utils;

import com.bamboo.base.ServiceConfig;
import com.bamboo.common.user.entity.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: acumes
 * @create: 2019-11-05 09:45:33
 * @description:
 */
@Component
public class SecureUtil {

    private static ServiceConfig serviceConfig;

    @Autowired
    public SecureUtil(ServiceConfig serviceConfig) {
        this.serviceConfig = serviceConfig;
    }

    public static User getUser() {
        HttpServletRequest request = WebUtil.getRequest();
        String token = request.getHeader (serviceConfig.getJwtHeader());
        Claims claims = Jwts.parser () //得到DefaultJwtParser
                .setSigningKey (serviceConfig.getJwtSigningKey()) //设置签名的秘钥
                .parseClaimsJws (token) //设置需要解析的jwt
                .getBody ();
        User user = new User();
        Long userId = (Long) claims.get("userId");
        String userName = (String) claims.get("userName");
        Long roleId = (Long) claims.get("roleId");
        String mobile = (String) claims.get("mobile");
        String account = (String) claims.get("account");
        user.setId(userId);
        user.setRoleId(roleId);
        user.setName(userName);
        user.setMobile(mobile);
        user.setAccount(account);
        return user;
    }

    public static Claims getClaims(HttpServletRequest request) {
        String token = request.getHeader (serviceConfig.getJwtHeader());
        Claims claims = Jwts.parser () //得到DefaultJwtParser
                .setSigningKey (serviceConfig.getJwtSigningKey()) //设置签名的秘钥
                .parseClaimsJws (token) //设置需要解析的jwt
                .getBody ();

        return claims;
    }

}
