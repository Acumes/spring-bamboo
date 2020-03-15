package com.bamboo.test;


import com.bamboo.base.BaseResponse;
import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import com.bamboo.basicinformationtips.entity.BasicInformationTips;
import com.bamboo.basicinformationtips.service.IBasicInformationTipsService;
import com.bamboo.coininfo.entity.CoinInfo;
import com.bamboo.coininfo.service.ICoinInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestViewController {

    @Autowired
    private IBasicInformationService basicInformationService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;
    @Autowired
    private IBasicInformationTipsService basicInformationTipsService;
    @Autowired
    private ICoinInfoService coinInfoService;

    @RequestMapping("/html")
    public ModelAndView actToAdd() {
        ModelAndView m = new ModelAndView("test");
        //查询谁当前价格低于目标价格
        List<BasicInformationTips> list = basicInformationTipsService.getCodesToday(null,"1",null);
        m.addObject("list",list);
        return m;
    }
    @GetMapping("/updateTargetPrice")
    @ResponseBody
    public BaseResponse<String> updateTargetPrice(@RequestParam String id) {
        BasicInformationTips byId = basicInformationTipsService.getById(id);
        byId.setIsDelete("0");
        basicInformationTipsService.updateById(byId);
        return new BaseResponse<>("成功");
    }
    @RequestMapping("/amplitudeHtml")
    public ModelAndView amplitudeHtml() {
        ModelAndView m = new ModelAndView("amplitude");
        //查询谁当前价格低于目标价格
        List<BasicInformationTips> list = basicInformationTipsService.getCodesToday(null,"2",null);
        m.addObject("list",list);
        return m;
    }
    @GetMapping("/updateSale")
    @ResponseBody
    public BaseResponse<String> updateSale(@RequestParam String id) {
//        redisTemplate.opsForValue().set("targetAmplitudeCron","1");
        BasicInformationTips byId = basicInformationTipsService.getById(id);
        byId.setIsDelete("0");
        basicInformationTipsService.updateById(byId);
        return new BaseResponse<>("成功");
    }
    @RequestMapping("/saleHtml")
    public ModelAndView saleHtml() {
        ModelAndView m = new ModelAndView("sale");
        //查询谁当前价格低于目标价格
        List<BasicInformationTips> list = basicInformationTipsService.getCodesToday(null,"3",null);
        m.addObject("list",list);
        return m;
    }
    @RequestMapping("/btcHtml")
    public ModelAndView btcHtml() {
        ModelAndView m = new ModelAndView("btcHtml");
        //查询谁当前价格低于目标价格
        List<CoinInfo> list = coinInfoService.list();
        m.addObject("list",list);
        return m;
    }
    @RequestMapping("/saleBtcUpdate")
    @ResponseBody
    public BaseResponse<String> saleBtcUpdate() {
        redisTemplate.opsForValue().set("saleBtc","1");
        return new BaseResponse<>("成功");
    }
    @RequestMapping("/saleBtc")
    public ModelAndView saleBtc() {
        ModelAndView m = new ModelAndView("saleBtc");
        //查询谁当前价格低于目标价格
        List<CoinInfo> list = coinInfoService.list();
        m.addObject("list",list);
        return m;
    }
    @RequestMapping("/btcUpdate")
    @ResponseBody
    public BaseResponse<String> btcUpdate() {
        redisTemplate.opsForValue().set("transBtc","1");
        return new BaseResponse<>("成功");
    }
    @GetMapping("/updateAmplitude")
    @ResponseBody
    public BaseResponse<String> updateAmplitude(@RequestParam String id) {
        BasicInformationTips byId = basicInformationTipsService.getById(id);
        byId.setIsDelete("0");
        basicInformationTipsService.updateById(byId);
        return new BaseResponse<>("成功");
    }
}
