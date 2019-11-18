package com.bamboo.web.test;

import com.bamboo.common.user.entity.User;
import com.bamboo.config.email.JavaEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: acumes
 * @create: 2019-11-12 15:03:24
 * @description:
 */
@RestController
@RequestMapping("/test")
public class TestController {
    @Autowired
    private JavaEmailService javaEmailService;

    @GetMapping("sendEmail")
    public String test(){
        Map<String, Object> model = new HashMap<String, Object>();
        List<User> users = new ArrayList<>();
        for(int i = 0; i < 6; i++){
            User us = new User();
            us.setAccount("ttt"+i);
            us.setPassword("ttt"+i);
            us.setSalt("ttt"+i);
            users.add(us);
        }
        model.put("username","12312312" );
        model.put("users",users);
        javaEmailService.setMap(model);
        javaEmailService.sendTemplateMail("906900526@qq.com","测试邮件",model,"email.html");
        return "success";
    }
}
