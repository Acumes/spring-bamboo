package com.bamboo.test;


import com.bamboo.base.BaseResponse;
import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestViewController {

    @Autowired
    private IBasicInformationService basicInformationService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @RequestMapping("/html")
    public ModelAndView actToAdd() {
        ModelAndView m = new ModelAndView("test");
        //查询谁当前价格低于目标价格
        List<BasicInformation> list = basicInformationService.getPriceGtTarget();
        m.addObject("list",list);
        return m;
    }
    @GetMapping("/updateTargetPrice")
    @ResponseBody
    public BaseResponse<String> updateTargetPrice() {
        redisTemplate.opsForValue().set("targetPriceCron","1");
        return new BaseResponse<>("成功");
    }
    @RequestMapping("/amplitudeHtml")
    public ModelAndView amplitudeHtml() {
        ModelAndView m = new ModelAndView("amplitude");
        //查询谁当前价格低于目标价格
        List<BasicInformation> list = basicInformationService.getAmplitudeGtTarget();
        m.addObject("list",list);
        return m;
    }
    @GetMapping("/updateAmplitude")
    @ResponseBody
    public BaseResponse<String> updateAmplitude() {
        redisTemplate.opsForValue().set("targetAmplitudeCron","1");
        return new BaseResponse<>("成功");
    }
}
