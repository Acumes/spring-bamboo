package com.bamboo.basicinformationtips.dao;

import com.bamboo.basicinformationtips.entity.BasicInformationTips;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author acumes
 * @since 2020-03-11
 */
public interface BasicInformationTipsDao extends BaseMapper<BasicInformationTips> {

    List<BasicInformationTips> getCodesToday(@Param("codes") List<String> codes, @Param("type") String type, @Param("date") String date);
}
