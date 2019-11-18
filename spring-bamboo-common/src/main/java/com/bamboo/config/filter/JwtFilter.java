package com.bamboo.config.filter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.bamboo.base.BaseResponse;
import com.bamboo.base.ServiceConfig;
import com.bamboo.utils.CommonUtil;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: acumes
 * @create: 2019-11-05 09:41:37
 * @description: jwt过滤器
 */
@Component
@Slf4j
public class JwtFilter extends HandlerInterceptorAdapter {

    @Resource
    private ServiceConfig serviceConfig;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof org.springframework.web.servlet.resource.ResourceHttpRequestHandler) {
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        return check(request, response, handlerMethod);
    }

    private boolean check(HttpServletRequest request, HttpServletResponse response, HandlerMethod handlerMethod) {
        String servletPath = request.getServletPath();//请求的api路径
        Boolean isLogin = CommonUtil.getIncludeStr(servletPath, Arrays.asList(serviceConfig.getPassTokenPaths().split(",")));
        Map<String, String> map = new HashMap<>();
        if (!isLogin) {
            map = this.checkToken(request, serviceConfig.getJwtSigningKey());
            if (!CommonUtil.isEmpty(map.get("message"))) {
                try {
                    ajaxReturn(response, 401, map.get("message"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return false;
            }
        }else{
            return true;
        }
        //不用校验权限的url
        if (!CommonUtil.getIncludeStr(servletPath, Arrays.asList(serviceConfig.getNoAuthorizations()))) {

        }

        return true;
    }

    public void ajaxReturn(HttpServletResponse response, int code, String msg) throws IOException, JSONException {
        try {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.setStatus(HttpStatus.OK.value());
            httpResponse.setContentType("application/json;charset=utf-8");
            BaseResponse baseResponse = CommonUtil.commonResponse(code, msg);
            httpResponse.getWriter().write(JSON.toJSONString(baseResponse));
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    private Map<String, String> checkToken(HttpServletRequest servletRequest, String jwtSigningKey) {
        Map<String, String> map = new HashMap<>();
        String message = "";
        String token = servletRequest.getHeader("Authorization");
        if (CommonUtil.isEmpty(token)) {
            map.put("message", "token is Empty");
            return map;
        }
        try {
            Claims claims = Jwts.parser()                     //得到DefaultJwtParser
                    .setSigningKey(jwtSigningKey) //设置签名的秘钥
                    .parseClaimsJws(token)        //设置需要解析的jwt
                    .getBody();
            String userId = claims.get("userId",Long.class).toString();
            map.put("userId", userId);
        } catch (Exception e) {
            log.warn("请求token{}", token);
            log.warn(e.getMessage());
            message = "没有访问权限.";
        }
        map.put("message", message);
        return map;
    }
}
