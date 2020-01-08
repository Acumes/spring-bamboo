package com.bamboo.basicinformation.dao;

import com.bamboo.basicinformation.entity.BasicInformation;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author acumes
 * @since 2020-01-07
 */
public interface BasicInformationDao extends BaseMapper<BasicInformation> {

    String getCodes();

    BasicInformation selectByCode(@Param("code") String code);
}
