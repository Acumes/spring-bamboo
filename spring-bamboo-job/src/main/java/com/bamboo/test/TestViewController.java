package com.bamboo.test;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test")
public class TestViewController {


    @RequestMapping("/html")
    public ModelAndView actToAdd() {
        ModelAndView m = new ModelAndView("test");
//        m.addObject("attachment",jsonArray.toString());
        return m;
    }
}
