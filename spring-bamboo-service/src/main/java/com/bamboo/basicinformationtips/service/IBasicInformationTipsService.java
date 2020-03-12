package com.bamboo.basicinformationtips.service;

import com.bamboo.basicinformationtips.entity.BasicInformationTips;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author acumes
 * @since 2020-03-11
 */
public interface IBasicInformationTipsService extends IService<BasicInformationTips> {

    List<BasicInformationTips> getCodesToday(List<String> codes,String type,String date);
}
