package com.bamboo.common.constant;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

public enum CodeAndMsgEnum {
    UNAUTHENTIC(100401, "无权访问，当前是匿名访问，请先登录！"),
    UNAUTHORIZED(100403, "无权访问，当前帐号权限不足！"),
    NOTFOUND(100404, "服务器未找到资源"),
    ACCOUNT_ERROR(100410, "该帐号不存在或已被禁用"),
    TOKEN_EXPIRED_ERROR(100411, "token已过期,请重新登录"),
    TOKEN_INVALID_ERROR(100412, "该token绑定的用户未找到.请重新登录"),
    ACCOUNT_NOT_EXIST_ERROR(100413, "该帐号不存在！"),
    ACCOUNT_PROHIBIT_ERROR(100414, "该帐号已被禁用！"),
    ACCOUNT_PASSWORD_ERROR(100415, "登录密码错误！"),
    IMAGE_VERIFICATION_CODE_ERROR(100416, "图片验证码错误！"),
    MENU_NOT_EXIST_ERROR(100510,"菜单不存在"),
    ROLE_NOT_EXIST_ERROR(100610,"角色不存在"),
    SYS_ERROR_CODE(999999, "系统异常！"),
    JSON_FORMAT_ERROR_CODE(999998, "JSON格式化异常！"),
    DATE_ILLEGAL(999997, "日期不合法！"),
    ERROR(100500, "服务器发生错误！");


    private int code;
    private String msg;

    CodeAndMsgEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Map<String, Object> result() {
        Map result = new HashMap<String, Object>(3);
        result.put("code", this.code);
        result.put("msg", this.msg);
        return result;
    }


}
