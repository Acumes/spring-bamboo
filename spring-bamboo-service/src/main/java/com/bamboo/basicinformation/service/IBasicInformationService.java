package com.bamboo.basicinformation.service;

import com.bamboo.basicinformation.entity.BasicInformation;
import com.baomidou.mybatisplus.extension.service.IService;

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
    String getCodes();

    BasicInformation selectByCode(String code1);
}
