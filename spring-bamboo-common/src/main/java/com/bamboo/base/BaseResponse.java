package com.bamboo.base;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author: acumes
 * @create: 2019-11-05 09:28:56
 * @description:
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BaseResponse<T> implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("返回状态")
    public boolean success = true;
    public T data;

    @ApiModelProperty("错误码")
    private Integer code = 200;
    @ApiModelProperty("错误信息")
    private String message;

    public BaseResponse(T t) {
        this.data = t;
    }
    public BaseResponse(String msg) {
        this.message = msg;
    }
    public BaseResponse(T t,String msg) {
        this.data = t;
        this.message = msg;
    }
    public BaseResponse() {
    }

    public BaseResponse(Integer code, String msg) {
        this.success = false;
        this.code = code;
        this.message = msg;
    }
}
