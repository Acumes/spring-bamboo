package com.bamboo.utils;


import org.apache.http.conn.ssl.AllowAllHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContextBuilder;
import org.apache.http.ssl.TrustStrategy;
import org.apache.http.util.TextUtils;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;


/**
 * Https忽略证书
 */
public class SSLClientCustom {
    private static SSLConnectionSocketFactory sslConnectionSocketFactory = null;
    private static SSLContextBuilder sslContextBuilder = null;//管理Https连接的上下文类
    private static String[] VERIFY_HOST_NAME_ARRAY = new String[]{};

    static {
        try {
            sslContextBuilder = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
                @Override
                public boolean isTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
//                    信任所有站点 直接返回true
                    return true;
                }
            });
            sslConnectionSocketFactory = new SSLConnectionSocketFactory(sslContextBuilder.build(), new String[]{"SSLv3", "TLSv1"}, null,createInsecureHostnameVerifier());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (KeyStoreException e) {
            e.printStackTrace();
        } catch (KeyManagementException e) {
            e.printStackTrace();
        }

    }

    /**
     * 获取连接
     *
     * @return
     * @throws Exception
     */
    public static CloseableHttpClient getHttpClinet() throws Exception {
        CloseableHttpClient httpClient = HttpClients.custom().setSSLSocketFactory(sslConnectionSocketFactory)
                .build();
        return httpClient;
    }

    public static final HostnameVerifier createInsecureHostnameVerifier() {
        return new HostnameVerifier() {
            public boolean verify(String hostname, SSLSession session) {
                if (TextUtils.isEmpty(hostname)) {
                    return false;
                }
                return !Arrays.asList(VERIFY_HOST_NAME_ARRAY).contains(hostname);
            }
        };
    }
}
