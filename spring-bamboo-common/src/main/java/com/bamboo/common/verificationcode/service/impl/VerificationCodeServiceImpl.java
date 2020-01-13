package com.bamboo.common.verificationcode.service.impl;

import com.bamboo.common.constant.CommonConstant;
import com.bamboo.common.verificationcode.service.VerificationCodeService;
import com.bamboo.utils.CommonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.script.*;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @author: acumes
 * @create: 2019-11-05 14:07:13
 * @description:
 */
@Service
@Slf4j
public class VerificationCodeServiceImpl implements VerificationCodeService {
    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    private String text = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ";
    private int length = 4;
    private int width = 200;
    private int height = 64;
    private Font font = new Font("Arial", Font.ITALIC | Font.BOLD, (int) (height * 0.8));
    private boolean crossLine = false;
    private boolean twistImage = true;

    @Override
    public BufferedImage genCaptcha() {
        // 在内存中创建图象
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 获取图形上下文
        Graphics g = image.getGraphics();
        // 生成随机类
        Random random = new Random();
        // 设定背景色
        g.setColor(new Color(255, 255, 255));
        g.fillRect(0, 0, width, height);
        // 设定字体
        g.setFont(font);
        // 取随机产生的验证码
        String sRand = "";
        int a = (int) (Math.random() * 100) % 2;
        //文字X坐标

        if(a == 0){
            String publicity = CommonUtil.getPublicity(null);
            String publicityShow = publicity + "=?";
            int codeX = width / (publicityShow.length() + 1);
            for(int i=0; i< publicityShow.length(); i++){
                g.setColor(getRandColor(100, 150));// 调用函数出来的颜色相同
                g.drawString(Character.toString(publicityShow.charAt(i)), codeX * i + 10, height - 20);
            }
            sRand = CommonUtil.getResult(publicity,null);
        }else{
            int codeX = width / (length + 1);
            for (int i = 0; i < length; i++) {
                String rand = String.valueOf(getRandomText());
                sRand += rand;
                //将验证码输出到图象中
                g.setColor(getRandColor(100, 150));// 调用函数出来的颜色相同
                g.drawString(rand, codeX * i + 10, height - 20);
            }
        }

        // 生成干扰线
        if (crossLine) {
            for (int i = 0; i < (random.nextInt(5) + 5); i++) {
                g.setColor(new Color(random.nextInt(255) + 1, random.nextInt(255) + 1, random.nextInt(255) + 1));
                g.drawLine(random.nextInt(width), random.nextInt(height), random.nextInt(width), random.nextInt(height));
            }
        }
        if (twistImage)
            image = twistImage(image);
        // 图象生效
        g.dispose();
        redisTemplate.opsForValue ().set (CommonConstant.CAPTCHA +sRand.toLowerCase (), sRand, 300, TimeUnit.SECONDS);
        return image;
    }

    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

    private BufferedImage twistImage(BufferedImage buffImg) {
        Random random = new Random();
        double dMultValue = random.nextInt(10) + 5;// 波形的幅度倍数，越大扭曲的程序越高，一般为3
        double dPhase = random.nextInt(6);// 波形的起始相位，取值区间(0-2＊PI)
        BufferedImage destBi = new BufferedImage(buffImg.getWidth(), buffImg.getHeight(), BufferedImage.TYPE_INT_RGB);
        Graphics g = destBi.getGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, buffImg.getWidth(), buffImg.getHeight());
        for (int i = 0; i < destBi.getWidth(); i++) {
            for (int j = 0; j < destBi.getHeight(); j++) {
                int nOldX = getXPosition4Twist(dPhase, dMultValue, destBi.getHeight(), i, j);
                int nOldY = j;
                if (nOldX >= 0 && nOldX < destBi.getWidth() && nOldY >= 0 && nOldY < destBi.getHeight())
                    destBi.setRGB(nOldX, nOldY, buffImg.getRGB(i, j));
            }
        }
        return destBi;
    }

    private int getXPosition4Twist(double dPhase, double dMultValue, int height, int xPosition, int yPosition) {
        double PI = 3.1415926535897932384626433832799; // 此值越大，扭曲程度越大
        double dx = (double) (PI * yPosition) / height + dPhase;
        double dy = Math.sin(dx);
        return xPosition + (int) (dy * dMultValue);
    }

    char getRandomText() {
        Random random = new Random();
        return text.charAt(random.nextInt(text.length()));
    }





}
