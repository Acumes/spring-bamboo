package com.bamboo.informationhistory.service.impl;

import com.bamboo.informationhistory.dao.InformationHistoryDao;
import com.bamboo.informationhistory.entity.InformationHistory;
import com.bamboo.informationhistory.service.IInformationHistoryService;
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
 * @since 2020-01-07
 */
@Service
public class InformationHistoryServiceImpl extends ServiceImpl<InformationHistoryDao, InformationHistory> implements IInformationHistoryService {

    @Autowired
    private InformationHistoryDao informationHistoryDao;

    @Override
    public InformationHistory selectByCode(String code) {
        return informationHistoryDao.selectByCode(code);
    }

    @Override
    public List<InformationHistory> selectByCodes(List<String> split) {
        return informationHistoryDao.selectByCodes(split);
    }

    @Override
    public void delTurnoverZero() {
        informationHistoryDao.delTurnoverZero();
    }
}
