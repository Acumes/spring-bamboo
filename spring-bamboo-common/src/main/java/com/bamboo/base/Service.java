package com.bamboo.base;

import com.baomidou.mybatisplus.extension.service.IService;

public interface Service<T> extends IService {
    T findBy(String fieldName, Object value);
}
