package com.bamboo.base;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

/**
 * @author: acumes
 * @create: 2019-11-05 09:42:35
 * @description: 系统参数
 */
@Data
@Component
@Configuration
public class ServiceConfig {
    @Value("${jwt.header}")
    private String jwtHeader="";
    @Value("${jwt.signing}")
    private String jwtSigningKey="";

    @Value("${spring.profiles.active}")
    private String environmental="";

    /**
     * 不需要加入token校验的请求路径
     */
    @Value("${jwt.passTokenPaths}")
    private String passTokenPaths="";

    @Value("${jwt.expiration}")
    private String jwtExpiration="";

    @Value("${noauthorization}")
    private String noAuthorizations="";
}
