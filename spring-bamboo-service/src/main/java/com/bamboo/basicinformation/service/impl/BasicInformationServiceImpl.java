package com.bamboo.basicinformation.service.impl;

import com.bamboo.basicinformation.dao.BasicInformationDao;
import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author acumes
 * @since 2020-01-07
 */
@Service
public class BasicInformationServiceImpl extends ServiceImpl<BasicInformationDao, BasicInformation> implements IBasicInformationService {

    @Autowired
    private BasicInformationDao basicInformationDao;

    @Override
    public String getCodes() {
        return basicInformationDao.getCodes();
    }

    @Override
    public BasicInformation selectByCode(String code1) {
        return basicInformationDao.selectByCode(code1);
    }
}
