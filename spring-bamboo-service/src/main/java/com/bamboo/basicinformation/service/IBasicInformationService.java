package com.bamboo.basicinformation.service;

import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.vo.request.BasicInformationRequest;
import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author acumes
 * @since 2020-01-07
 */
public interface IBasicInformationService extends IService<BasicInformation> {

    /**
     * 获取所有编码
     * @return
     */
    List<BasicInformation> getCodes();

    BasicInformation selectByCode(String code1);

    /**
     * 获取列表
     * @return
     */
    PageInfo<BasicInformation> getList(BasicInformationRequest request);

    void add(BasicInformationRequest request);

    List<BasicInformation> getPriceGtTarget();
}
