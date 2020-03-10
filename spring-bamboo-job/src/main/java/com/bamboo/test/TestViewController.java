package com.bamboo.test;


import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestViewController {

    @Autowired
    private IBasicInformationService basicInformationService;

    @RequestMapping("/html")
    public ModelAndView actToAdd() {
        ModelAndView m = new ModelAndView("test");
        //查询谁当前价格低于目标价格
        List<BasicInformation> list = basicInformationService.getPriceGtTarget();
        m.addObject("list",list);
        return m;
    }
}
