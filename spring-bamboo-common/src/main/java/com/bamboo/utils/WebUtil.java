package com.bamboo.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.Nullable;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: acumes
 * @create: 2019-11-05 09:53:25
 * @description:
 */
public class WebUtil {
    private static final Logger log = LoggerFactory.getLogger(WebUtil.class);
    public static final String USER_AGENT_HEADER = "user-agent";
    public static final String UN_KNOWN = "unknown";

    public WebUtil() {
    }

    public static void removeCookie(HttpServletResponse response, String key) {
        setCookie(response, key, (String)null, 0);
    }

    public static void setCookie(HttpServletResponse response, String name, @Nullable String value, int maxAgeInSeconds) {
        Cookie cookie = new Cookie(name, value);
        cookie.setPath("/");
        cookie.setMaxAge(maxAgeInSeconds);
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
    }

    public static HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes ()).getRequest ();
        return request;
    }

    public static byte[] getRequestBytes(HttpServletRequest request) throws IOException {
        int contentLength = request.getContentLength();
        if (contentLength < 0) {
            return null;
        } else {
            byte[] buffer = new byte[contentLength];

            int readlen;
            for(int i = 0; i < contentLength; i += readlen) {
                readlen = request.getInputStream().read(buffer, i, contentLength - i);
                if (readlen == -1) {
                    break;
                }
            }

            return buffer;
        }
    }
}
