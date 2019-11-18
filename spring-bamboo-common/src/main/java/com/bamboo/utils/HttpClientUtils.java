package com.bamboo.utils;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;


public class HttpClientUtils {
    private static final Logger logger  = LoggerFactory.getLogger(HttpClientUtils.class);

    private static final String parameterJoin  = "&";
    private static final String parameterEqual = "=";

    /**
	     * 构造url的get请求方式
	* @param baseUrl  请求资源
	* @param parameterMap  请求参数
	* @return
	*/
    public static String appendParameter(String baseUrl, Map<String, String> parameterMap) {
        StringBuffer parasb = new StringBuffer(baseUrl);
        if (null != parameterMap) {
        	parasb.append("?");
            for (Map.Entry<String, String> entry : parameterMap.entrySet()) {
                String val;
                try {
                    val = URLEncoder.encode(entry.getValue(), "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    val = entry.getValue();
                }
                parasb.append(entry.getKey()).append(parameterEqual).append(val).append(parameterJoin);

            }
        }
        return parasb.substring(0, parasb.length() - 1);
    }

    /**
     * get 请求，没有任何参数
     * @param url
     * @return
     * @throws Exception
     */
    public static String get(String url) throws Exception {

        CloseableHttpClient httpclient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        try {
            HttpGet httpGet = new HttpGet(url);
            response = httpclient.execute(httpGet);
            InputStream inputStream = response.getEntity().getContent();
            BufferedReader rd = new BufferedReader(new InputStreamReader(inputStream));
            String line = "";
            StringBuffer resultString = new StringBuffer();
            while ((line = rd.readLine()) != null) {
                resultString.append(line);
            }
            return resultString.toString();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        } finally {
            try {
                response.close();
                httpclient.close();
            } catch (Exception ignore) {
            	
            }
        }
		return null;
    }
    
    /**
     * get请求，带参数
     * @param url 请求url
     * @param params  请求参数
     * @return
     * @throws Exception 异常
     */
    public static String get(String url, Map<String, String> params) throws Exception {
        return get(url,params,null);
    }

    public static String get(String url, Map<String, String> params,Map<String,String> headers) throws Exception {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        try {
            String newUrl = appendParameter(url, params);
            HttpGet httpGet = new HttpGet(newUrl);
            Iterator headerIterator = headers.entrySet().iterator();          //循环增加header
            while(headerIterator.hasNext()){
                Map.Entry<String,String> elem = (Map.Entry<String, String>) headerIterator.next();
                httpGet.addHeader(elem.getKey(),elem.getValue());
            }
            response = httpclient.execute(httpGet);
            InputStream inputStream = response.getEntity().getContent();
            BufferedReader rd = new BufferedReader(new InputStreamReader(inputStream));
            String line = "";
            StringBuffer resultString = new StringBuffer();
            while ((line = rd.readLine()) != null) {
                resultString.append(line);
            }
            return resultString.toString();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        } finally {
            try {
                response.close();
                httpclient.close();
            } catch (Exception ignore) {
            }
        }
        return null;
    }

    /**
     * post请求，带参数
     * @param url 请求路径
     * @param params 请求参数
     * @return
     * @throws Exception
     */
    public static String post(String url, Map<String, String> params) throws Exception {
        return post(url,params,null);
    }

    public static String post(String url, Map<String, String> params,Map<String, String> headers) throws Exception {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        try {
            List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
            for (String key : params.keySet()) {
                nameValuePairs.add(new BasicNameValuePair(key, params.get(key)));
            }
            HttpPost httpPost = new HttpPost(url);
            Iterator headerIterator = headers.entrySet().iterator();          //循环增加header
            while(headerIterator.hasNext()){
                Map.Entry<String,String> elem = (Map.Entry<String, String>) headerIterator.next();
                httpPost.addHeader(elem.getKey(),elem.getValue());
            }

            httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs, "utf-8"));
            response = httpclient.execute(httpPost);
            InputStream inputStream = response.getEntity().getContent();
            BufferedReader rd = new BufferedReader(new InputStreamReader(inputStream));
            String line = "";
            StringBuffer resultString = new StringBuffer();
            while ((line = rd.readLine()) != null) {
                resultString.append(line);
            }
            return resultString.toString();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        } finally {
            try {
                response.close();
                httpclient.close();
            } catch (Exception ignore) {
            }
        }
        return null;
    }
    
    /**
     * raw方式的请求
     * @param url  请求url
     * @param params  请求参数键-值
     * @return
     * @throws Exception
     */
    public static <T> String postJsonRaw(String url,Map<String,String> params) throws Exception {

        return postJsonRaw(url,params,null);
    }

    public static <T> String postJsonRaw(String url,Map<String,String> params,Map<String,String> headers) throws Exception {
        String jsonString = com.alibaba.fastjson.JSONObject.toJSONString(params);
        logger.info(jsonString);
        CloseableHttpClient httpclient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        try {
            HttpPost httpPost = new HttpPost(url);
            httpPost.addHeader("Content-Type", "application/json");
            Iterator headerIterator = headers.entrySet().iterator();          //循环增加header
            while(headerIterator.hasNext()){
                Map.Entry<String,String> elem = (Map.Entry<String, String>) headerIterator.next();
                httpPost.addHeader(elem.getKey(),elem.getValue());
            }
            StringEntity se = new StringEntity(jsonString, "UTF-8");
            se.setContentType("application/json");
            httpPost.setEntity(se);
            response = httpclient.execute(httpPost);
            InputStream inputStream = response.getEntity().getContent();
            BufferedReader rd = new BufferedReader(new InputStreamReader(inputStream));
            String line = "";
            StringBuffer resultString = new StringBuffer();
            while ((line = rd.readLine()) != null) {
                resultString.append(line);
            }
            return resultString.toString();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        } finally {
            try {
                response.close();
                httpclient.close();
            } catch (Exception ignore) {
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
    	/**
    	 * 发起交易
    	 */
    	/*Map<String,String> postParam= new HashMap<String, String>();
		postParam.put("uid", "184dbf08be8b6c84b7b8acbfeedb9ccf");
		postParam.put("smsCode", "9562");
		postParam.put("payAmount", "20.00");
		postParam.put("payPassword", "123456");
		postParam.put("payType", "1");
		postParam.put("remark", "哈哈");
    	try {
    		YbtPayResponse s = (YbtPayResponse) postJsonRaw("http://47.75.54.110:8081/ybt-api/pay", postParam,YbtPayResponse.class,"5x2zu$!DBb4Z3b)1TscI#NUB2CGDygzTCY8tnfPy!L660Fy^!oxYxM]GYRtMx#AWHQ9w56!UD)CvCjn9",new SignYBT());
			System.out.println(JSONUtil.toString(s));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
    	
    	
    	/**
    	 * 查询汇率
    	 */
    	/*Map<String, String> postParam1 = new HashMap<String, String>();
		postParam1.put("uid", "257b24b19c3ff0c43086ca0a22884e34");
		
		try {
			ExchangeRateResponse exchangeRate = (ExchangeRateResponse) get("http://main.youbank.top/api/exchange/ybt", postParam1,ExchangeRateResponse.class,"5x2zu$!DBb4Z3b)1TscI#NUB2CGDygzTCY8tnfPy!L660Fy^!oxYxM]GYRtMx#AWHQ9w56!UD)CvCjn9",new SignYBT());
			System.out.println(JSONUtil.toString(exchangeRate));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
    	
    	/**
    	 * 发送验证码
    	 */
    	Map<String,Object> postParam2= new HashMap<String, Object>();
    	postParam2.put("uid", "257b24b19c3ff0c43086ca0a22884e34");
    	postParam2.put("platformType", "2");
		try {
//			JSONObject jsonObject = httpRequest("https://main.youbank.top/api/exchange/ybt","GET",JSONUtil.toString(postParam2));
//			System.out.println(JSONUtil.toString(jsonObject));*/
//			postJsonRaw("https://main.youbank.top/api/send-smscode", postParam2,"5x2zu$!DBb4Z3b)1TscI#NUB2CGDygzTCY8tnfPy!L660Fy^!oxYxM]GYRtMx#AWHQ9w56!UD)CvCjn9", new SignYBT());
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*Map<String,String> headers = Maps.newHashMap();
		headers.put("Content-Type", "application/json");*/
	}
    
}