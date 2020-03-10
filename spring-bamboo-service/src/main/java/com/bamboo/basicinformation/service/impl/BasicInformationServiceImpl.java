package com.bamboo.basicinformation.service.impl;

import com.bamboo.basicinformation.dao.BasicInformationDao;
import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import com.bamboo.basicinformation.vo.request.BasicInformationRequest;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public List<BasicInformation> getCodes() {
        return basicInformationDao.getCodes();
    }

    @Override
    public BasicInformation selectByCode(String code1) {
        return basicInformationDao.selectByCode(code1);
    }

    @Override
    public PageInfo<BasicInformation> getList(BasicInformationRequest request) {
        PageHelper.startPage(request.getPageNo(), request.getPageSize());
        List<BasicInformation> list = basicInformationDao.getList(request);
        PageInfo<BasicInformation> pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public void add(BasicInformationRequest request) {
        BasicInformation basicInformation = new BasicInformation();
        BeanUtils.copyProperties(request,basicInformation);
        basicInformationDao.insert(basicInformation);
    }

    @Override
    public List<BasicInformation> getPriceGtTarget() {
        return basicInformationDao.getPriceGtTarget();
    }
}
