package com.bamboo.basicinformation.dao;

import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.vo.request.BasicInformationRequest;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author acumes
 * @since 2020-01-07
 */
public interface BasicInformationDao extends BaseMapper<BasicInformation> {

    List<BasicInformation> getCodes();

    BasicInformation selectByCode(@Param("code") String code);

    /**
     * 查询列表
     * @param request
     * @return
     */
    List<BasicInformation> getList(BasicInformationRequest request);

    List<BasicInformation> getPriceGtTarget();

    List<BasicInformation> getAmplitudeGtTarget();
}
