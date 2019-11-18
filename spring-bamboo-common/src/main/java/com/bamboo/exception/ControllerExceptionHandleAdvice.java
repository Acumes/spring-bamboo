package com.bamboo.exception;

import com.bamboo.base.BaseResponse;
import com.bamboo.common.constant.CommonConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


@ControllerAdvice
public class ControllerExceptionHandleAdvice {

    private final static Logger logger = LoggerFactory.getLogger(ControllerExceptionHandleAdvice.class);

    /**
     * 全局异常捕捉处理
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public BaseResponse errorHandler(Exception e) {
        e.printStackTrace();
        return new BaseResponse(CommonConstant.SYS_ERROR_CODE,e.getMessage());
    }

    /**
     * 拦截捕捉自定义异常 ServiceException.class
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = ServiceException.class)
    public BaseResponse myErrorHandler(ServiceException e) {
        e.printStackTrace();
        return new BaseResponse(e.getCode(), e.getMsg());
    }
}
