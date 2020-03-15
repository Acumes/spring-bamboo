package com.bamboo.coinsymbol.service.impl;

import com.bamboo.coinsymbol.dao.CoinSymbolDao;
import com.bamboo.coinsymbol.entity.CoinSymbol;
import com.bamboo.coinsymbol.service.ICoinSymbolService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 币种交易对 服务实现类
 * </p>
 *
 * @author acumes
 * @since 2020-03-13
 */
@Service
public class CoinSymbolServiceImpl extends ServiceImpl<CoinSymbolDao, CoinSymbol> implements ICoinSymbolService {

}
