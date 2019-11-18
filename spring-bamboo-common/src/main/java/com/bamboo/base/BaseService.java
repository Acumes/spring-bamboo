package com.bamboo.base;

import com.bamboo.utils.CommonUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;

/**
 * @author: acumes
 * @create: 2019-11-04 14:55:06
 * @description:
 */
public class BaseService<M extends BaseMapper<T>, T> extends ServiceImpl implements Service<T>{
    @Override
    public T findBy(String fieldName, Object value) {
        QueryWrapper<T> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(fieldName,value);
        List<T> studentList = list(queryWrapper);
        if(CommonUtil.isEmpty(studentList)){
            return null;
        }
        return studentList.get(0);
    }
}
