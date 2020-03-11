package com.bamboo.basicinformationtips.service.impl;

import com.bamboo.basicinformationtips.dao.BasicInformationTipsDao;
import com.bamboo.basicinformationtips.entity.BasicInformationTips;
import com.bamboo.basicinformationtips.service.IBasicInformationTipsService;
import com.bamboo.utils.DateUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author acumes
 * @since 2020-03-11
 */
@Service
public class BasicInformationTipsServiceImpl extends ServiceImpl<BasicInformationTipsDao, BasicInformationTips> implements IBasicInformationTipsService {

    @Autowired
    private BasicInformationTipsDao basicInformationTipsDao;

    @Override
    public List<BasicInformationTips> getCodesToday(List<String> codes,String type) {
        return basicInformationTipsDao.getCodesToday(codes,type, DateUtils.getStringDateShort());
    }
}
