package com.bamboo.test;

import com.alibaba.fastjson.JSON;
import com.bamboo.test.entity.Peitu;
import com.bamboo.test.entity.Yinpin;
import com.bamboo.test.service.IPeituService;
import com.bamboo.test.service.IYinpinService;
import com.bamboo.utils.CommonUtil;
import com.bamboo.utils.DateUtils;
import com.bamboo.utils.Excel2Util;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.compress.utils.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import java.io.*;
import java.security.KeyFactory;
import java.security.interfaces.RSAPrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author: acumes
 * @create: 2020-01-10 18:14:26
 * @description:
 */
@Component
@Slf4j
public class Tsdf {

    @Autowired
    private IYinpinService yinpinService;
    @Autowired
    private IPeituService iPeituService;

//    @Scheduled(cron = "0/10 * *  * * ? ") // 每分钟
    public void test() throws FileNotFoundException {
//        List<Yinpin> list1 = yinpinService.list();
//        List<Peitu> list1 = iPeituService.list();
//        if(!CommonUtil.isEmpty(list1)){
//            System.out.println("=========>>>>>>");
//        }else{
//            List<File> list = new ArrayList<>();
//            getAllFileName("F:\\zxh\\shangchuan",list);
////            List<Yinpin> list2 = new ArrayList<>();
//            List<Peitu> list2 = new ArrayList<>();
//            for (int i = 0; i < list.size(); i++) {
//                if (list.get(i).isFile()) {
//                    String columns[] = {"title", "small_title", "xuance", "daan", "yinpin", "peitu"};
//                    // 获取文件名
//                    String fileName = list.get(i).getName();
//                    // 获取文件的后缀名
//                    String suffixName = fileName.substring(fileName.lastIndexOf("."));
//                    InputStream inputStream = new FileInputStream(list.get(i));
//                    if(!"【总】沪教版-导入系统格式".equalsIgnoreCase(fileName)){
//                        List<Map<String, String>> excelList = Excel2Util.excelList(inputStream, fileName, columns);
//                        System.out.println("文件：" + fileName);
//                        installPeiTu(excelList,list2,fileName);
//                        iPeituService.saveBatch(list2);
//                    }
////                    installYinPin(excelList,list2,fileName);
////                    yinpinService.saveBatch(list2);
//                }
//            }
//        }



    }

    private void installPeiTu(List<Map<String, String>> excelList, List<Peitu> list2, String fileName) {
        for(Map<String,String> map : excelList){
            Peitu yinpin = new Peitu();
            yinpin.setDaan(map.get("daan"));
            yinpin.setFile(fileName);
            yinpin.setPeitu(map.get("peitu"));
            yinpin.setXuanci(map.get("xuance"));
            yinpin.setYinpin(map.get("yinpin"));
            yinpin.setSmallTitle(map.get("small_title"));
            yinpin.setTitle(map.get("title"));
            list2.add(yinpin);
        }
    }

    private void installYinPin(List<Map<String, String>> excelList, List<Yinpin> list2,String fileName) {
        for(Map<String,String> map : excelList){
            Yinpin yinpin = new Yinpin();
            yinpin.setFaultRemark(map.get("remark"));
            yinpin.setFile(fileName);
            yinpin.setFileName(map.get("fileName"));
            yinpin.setStatus(map.get("status"));
            yinpin.setSuccessUrl(map.get("url"));
            try {
                yinpin.setTime(DateUtils.getDateMillisecond2222(map.get("time")));
            } catch (Exception e) {
                e.printStackTrace();
            }
            yinpin.setSize(map.get("size"));
            list2.add(yinpin);
        }
    }

    /**
     * 获取某个文件夹下的所有文件
     *
     * @param fileNameList 存放文件名称的list
     * @param path 文件夹的路径
     * @return
     */
    public static void getAllFileName(String path, List<File> fileNameList) {
        //ArrayList<String> files = new ArrayList<String>();
        boolean flag = false;
        File file = new File(path);
        File[] tempList = file.listFiles();

        for (int i = 0; i < tempList.length; i++) {
            if (tempList[i].isFile()) {
//              System.out.println("文     件：" + tempList[i]);
                //fileNameList.add(tempList[i].toString());
                fileNameList.add(tempList[i]);
            }
            if (tempList[i].isDirectory()) {
//              System.out.println("文件夹：" + tempList[i]);
                getAllFileName(tempList[i].getAbsolutePath(),fileNameList);
            }
        }
    }

    public static void main(String[] args) {
//        CommonUtil.openLiulanqi();
//        List<Integer> a = Arrays.asList(1,4,7,43,23,42,541,234,46);
//        System.out.println(a);
//        a=a.stream().sorted().collect(Collectors.toList());
//        System.out.println(a);
        for(int i = 7; i > 1; i--){
            System.out.println(i);
        }
        System.out.println("======");
    }

    public static void verifySign(String ivSign,String verifySecret) {
        try {
            byte[] encryptedData = java.util.Base64.getDecoder().decode(ivSign.getBytes("utf-8"));
            byte[] keyData = java.util.Base64.getDecoder().decode(verifySecret.getBytes());
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyData);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            RSAPrivateKey privateKey = (RSAPrivateKey) keyFactory.generatePrivate(keySpec);
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(Cipher.DECRYPT_MODE, privateKey);
            String content = new String(doBlock(encryptedData, privateKey.getModulus().bitLength()/8, cipher),"utf-8");
            Map<String,String> map = JSON.parseObject(content,Map.class);
            //校验通过
        }catch (Exception e){

        }
    }

    private static byte[] doBlock(byte[] encryptedData, int blockSize, Cipher cipher) throws Exception {
        int inputLen = encryptedData.length;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int offSet = 0;
        byte[] cache;
        int i = 0;
        // 对数据分段解密
        while (inputLen - offSet > 0) {
            if (inputLen - offSet > blockSize) {
                cache = cipher.doFinal(encryptedData, offSet, blockSize);
            }else {
                cache = cipher.doFinal(encryptedData, offSet, inputLen - offSet);
            }
            out.write(cache, 0, cache.length);
            i++;
            offSet = i * blockSize;
        }
        byte[] decryptedData = out.toByteArray();
        IOUtils.closeQuietly(out);
        return decryptedData;
    }

}
