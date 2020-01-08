package com.bamboo.utils;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HttpClientUtilsSSL {

	/**
	 * 发送post请求
	 *
	 * @param            url:请求地址
	 * @param            header:请求头参数
	 * @param            params:表单参数 form提交
	 * @param            containHeader:是否包括请求头，默认为true
	 * @param httpEntity json/xml参数
	 * @return
	 */
	public static String doPostRequest(String url, Map<String, String> header, Map<String, String> params,
                                       HttpEntity httpEntity, boolean containHeader) {
		String resultStr = "";

		if (CommonUtil.isEmpty(url)) {
			return resultStr;
		}
		CloseableHttpClient httpClient = null;
		CloseableHttpResponse httpResponse = null;
		InputStream inputStream = null;
		BufferedReader rd = null;
		try {
			httpClient = SSLClientCustom.getHttpClinet();
			HttpPost httpPost = new HttpPost(url);
			if(containHeader){
				// 请求头header信息
				if (!CommonUtil.isEmpty(header)) {
					for (Map.Entry<String, String> stringStringEntry : header.entrySet()) {
						httpPost.setHeader(stringStringEntry.getKey(), stringStringEntry.getValue());
					}
				}else {
					//默认json
					httpPost.setHeader("Content-Type", "application/json");
					httpPost.setHeader("charset", "UTF-8");
				}
			}
			// 请求参数信息
			if (!CommonUtil.isEmpty(params)) {
				List<NameValuePair> paramList = new ArrayList<NameValuePair>();
				for (Map.Entry<String, String> stringStringEntry : params.entrySet()) {
					paramList.add(new BasicNameValuePair(stringStringEntry.getKey(), stringStringEntry.getValue()));
				}
				UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(paramList, Consts.UTF_8);
				httpPost.setEntity(urlEncodedFormEntity);
			}
			// 实体设置
			if (httpEntity != null) {
				httpPost.setEntity(httpEntity);
			}

			// 发起请求
			httpResponse = httpClient.execute(httpPost);
			int statusCode = httpResponse.getStatusLine().getStatusCode();
			if (statusCode == HttpStatus.SC_OK) {
				HttpEntity httpResponseEntity = httpResponse.getEntity();
				resultStr = EntityUtils.toString(httpResponseEntity, Consts.UTF_8);
			} else {
				inputStream = httpResponse.getEntity().getContent();
	            rd = new BufferedReader(new InputStreamReader(inputStream));
	            String line = "";
	            StringBuffer resultString = new StringBuffer();
	            while ((line = rd.readLine()) != null) {
	                resultString.append(line);
	            }
	            return resultString.toString();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(inputStream !=null&&rd!=null) {
					rd.close();
					inputStream.close();
				}
				if(httpClient!=null && httpResponse!=null) {
					httpClient.close();
					httpResponse.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return resultStr;
	}


	public static String doGetRequest(String url, Map<String, String> header, Map<String, String> params,boolean containHeader) {
		String resultStr = "";
		if (CommonUtil.isEmpty(url)) {
			return resultStr;
		}
		CloseableHttpClient httpClient = null;
		CloseableHttpResponse httpResponse = null;
		InputStream inputStream = null;
		BufferedReader rd = null;
		try {
			httpClient = SSLClientCustom.getHttpClinet();
			// 请求参数信息
			if (!CommonUtil.isEmpty(params)) {
				url = url + buildUrl(params);
			}
			HttpGet httpGet = new HttpGet(url);
			RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(5000)// 连接超时
					.setConnectionRequestTimeout(5000)// 请求超时
					.setSocketTimeout(5000)// 套接字连接超时
					.setRedirectsEnabled(true).build();// 允许重定向
			httpGet.setConfig(requestConfig);
			if(containHeader){
				if (!CommonUtil.isEmpty(header)) {
					for (Map.Entry<String, String> stringStringEntry : header.entrySet()) {
						httpGet.setHeader(stringStringEntry.getKey(), stringStringEntry.getValue());
					}
				}else {
					//默认json
					httpGet.setHeader("Content-Type", "application/json");
				}
			}
			// 发起请求
			httpResponse = httpClient.execute(httpGet);
			int statusCode = httpResponse.getStatusLine().getStatusCode();
			if (statusCode == HttpStatus.SC_OK) {
				resultStr = EntityUtils.toString(httpResponse.getEntity(), Consts.UTF_8);
			} else {
				inputStream = httpResponse.getEntity().getContent();
	            rd = new BufferedReader(new InputStreamReader(inputStream));
	            String line = "";
	            StringBuffer resultString = new StringBuffer();
	            while ((line = rd.readLine()) != null) {
	                resultString.append(line);
	            }
	            return resultString.toString();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(inputStream !=null&&rd!=null) {
					rd.close();
					inputStream.close();
				}
				if(httpClient!=null && httpResponse!=null) {
					httpClient.close();
					httpResponse.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return resultStr;
	}

	/**
	 * 构造get请求的参数
	 *
	 * @return
	 */
	private static String buildUrl(Map<String, String> map) {
		if (CommonUtil.isEmpty(map)) {
			return "";
		}
		StringBuffer stringBuffer = new StringBuffer("?");
		for (Map.Entry<String, String> stringStringEntry : map.entrySet()) {
			stringBuffer.append(stringStringEntry.getKey()).append("=").append(stringStringEntry.getValue())
					.append("&");
		}
		String result = stringBuffer.toString();
		if (CommonUtil.isEmpty(result)) {
			result = result.substring(0, result.length() - 1);// 去掉结尾的&连接符
		}
		return result;
	}
}
