package com.bamboo.exception;

import lombok.Data;

/**
 * @author: acumes
 * @create: 2019-11-04 10:53:28
 * @description:
 */
@Data
public class ServiceException extends RuntimeException{
    private static final long serialVersionUID = 520331709134403733L;
    /**
     *
     */
    private String msg;
    private Integer code;

    public ServiceException(String msg){
        super(msg);
        this.msg=msg;
    }
    public ServiceException(Integer code, String msg){
        this.code = code;
        this.msg=msg;
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }
}
