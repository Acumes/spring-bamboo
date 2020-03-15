package com.bamboo.coininfohistory.service.impl;

import com.bamboo.coininfohistory.dao.CoinInfoHistoryDao;
import com.bamboo.coininfohistory.entity.CoinInfoHistory;
import com.bamboo.coininfohistory.service.ICoinInfoHistoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 币种信息历史表 服务实现类
 * </p>
 *
 * @author acumes
 * @since 2020-03-15
 */
@Service
public class CoinInfoHistoryServiceImpl extends ServiceImpl<CoinInfoHistoryDao, CoinInfoHistory> implements ICoinInfoHistoryService {

}
