package com.bamboo.web.test;

import com.bamboo.common.user.entity.User;
import com.bamboo.config.email.JavaEmailService;
import com.bamboo.utils.HttpClientUtils;
import com.bamboo.utils.HttpClientUtilsSSL;
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
    @GetMapping("testSf")
    public String testSf(){
        String s = HttpClientUtilsSSL.doGetRequest("https://stats.testnet.filecoin.io/api/datasources/proxy/3/query?db=testnet&q=SELECT%20%22value%22%2C%20%22tipset%22%20FROM%20%22chain.height%22%20WHERE%20time%20%3E%3D%20now()%20-%2030m&epoch=ms", null, null, false,null);
        System.out.println(s);
        Map<String,String> headers = new HashMap<>();
        headers.put("Authorization", "APPCODE 12aecd9f72084d4dabf07e6dcf658948");
        String url = "https://safrvcert.market.alicloudapi.com/safrv_2meta_id_name/?userId=1518668800502017&identifyNum=441429199412270411&userName=黄铁锋&verifyKey=IV7v3rTZ6T9ofI";
        String b = HttpClientUtilsSSL.doGetRequest(url, headers, null, false,null);
        System.out.println("b>>>" + b);
        return "123";
    }

}
