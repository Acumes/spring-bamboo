package com.bamboo.web.test;

import com.bamboo.utils.HttpUtils;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author: acumes
 * @create: 2020-03-15 20:14:03
 * @description:
 */
public class TestMain {
    public static void main(String[] args) {
        String host = "https://safrvcert.market.alicloudapi.com";
        String path = "/safrv_2meta_id_name/";
        String method = "GET";
        String appcode = "12aecd9f72084d4dabf07e6dcf658948";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("__userId", "1518668800502017");
        querys.put("identifyNum", "441423199412270412");
        querys.put("userName", "黄铁锋");
        querys.put("verifyKey", "IVqmXoOBYuUVbU");


        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            //错误信息见X-Ca-Error-Message字段
            System.out.println(response.toString());
            //获取response的body
            System.out.println(EntityUtils.toString(response.getEntity()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
