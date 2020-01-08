package com.bamboo.informationhistory.service;

import com.bamboo.informationhistory.entity.InformationHistory;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author acumes
 * @since 2020-01-07
 */
public interface IInformationHistoryService extends IService<InformationHistory> {

    InformationHistory selectByCode(String code);
}
