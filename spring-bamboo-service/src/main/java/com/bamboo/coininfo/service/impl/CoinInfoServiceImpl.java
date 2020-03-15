package com.bamboo.coininfo.service.impl;

import com.bamboo.coininfo.dao.CoinInfoDao;
import com.bamboo.coininfo.entity.CoinInfo;
import com.bamboo.coininfo.service.ICoinInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 币种信息表 服务实现类
 * </p>
 *
 * @author acumes
 * @since 2020-03-13
 */
@Service
public class CoinInfoServiceImpl extends ServiceImpl<CoinInfoDao, CoinInfo> implements ICoinInfoService {

}
