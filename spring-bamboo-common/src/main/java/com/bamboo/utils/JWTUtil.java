package com.bamboo.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.Map;

/**
 * @author: acumes
 * @create: 2019-11-05 13:53:28
 * @description:
 */
public class JWTUtil {
    public static String createJWT(Long id, Map<String, Object> claims, long validityPeriod, String jwtSigningKey) {
        //指定签名的时候使用的签名算法，也就是header那部分，jjwt已经将这部分内容封装好了。
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        //生成JWT的时间
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        //下面就是在为payload添加各种标准声明和私有声明了
        //这里其实就是new一个JwtBuilder，设置jwt的body
        JwtBuilder builder = Jwts.builder()
                .setClaims(claims) //如果有私有声明，一定要先设置这个自己创建的私有的声明，这个是给builder的claim赋值，一旦写在标准的声明赋值之后，就是覆盖了那些标准的声明的
                .setId(id.toString()) //设置jti(JWT ID)：是JWT的唯一标识，根据业务需要，这个可以设置为一个不重复的值，主要用来作为一次性token,从而回避重放攻击。
                .setIssuedAt(now) //iat: jwt的签发时间
                .setSubject(id.toString())//代表这个JWT的主体，即它的所有人，这个是一个json格式的字符串，可以存放什么userid，roldid之类的，作为什么用户的唯一标志。
                .signWith(signatureAlgorithm, jwtSigningKey); //设置签名使用的签名算法和签名使用的秘钥
        long expMillis = nowMillis + (validityPeriod * 1000);
        Date exp = new Date(expMillis);
        builder.setExpiration(exp); //设置过期时间
        return builder.compact();
    }

    public static Claims parseJWT(String jwt, String jwtSigningKey) throws Exception {
        Claims claims = Jwts.parser()    //得到DefaultJwtParser
                .setSigningKey(jwtSigningKey) //设置签名的秘钥
                .parseClaimsJws(jwt)          //设置需要解析的jwt
                .getBody();
        return claims;
    }
}
