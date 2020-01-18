package com.bamboo.basicinformation.vo.request;

import com.bamboo.base.BasePageRequest;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class BasicInformationRequest extends BasePageRequest {
    private String name;
    private String code;
    private BigDecimal currentPrice;
    private BigDecimal targetPrice;
    private String concept;
    private String remark;
}
