package com.bamboo.informationhistory.dao;

import com.bamboo.informationhistory.entity.InformationHistory;
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
public interface InformationHistoryDao extends BaseMapper<InformationHistory> {

    InformationHistory selectByCode(@Param("code") String code);
}
