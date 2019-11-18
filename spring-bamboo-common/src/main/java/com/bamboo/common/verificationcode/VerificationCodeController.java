package com.bamboo.common.verificationcode;

import com.bamboo.base.BaseResponse;
import com.bamboo.common.verificationcode.service.VerificationCodeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * @author: acumes
 * @create: 2019-11-05 14:03:57
 * @description:
 */
@Api(tags = "验证码")
@RestController
public class VerificationCodeController {
    @Autowired
    private VerificationCodeService verificationCodeService;

    @GetMapping("/captcha")
    @ApiOperation("生成图片验证码")
    public void genCaptcha (HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedImage image = verificationCodeService.genCaptcha();
        ServletOutputStream responseOutputStream = response.getOutputStream ();
        // 输出图象到页面
        ImageIO.write (image, "JPEG", responseOutputStream);
        // 以下关闭输入流！
        response.setHeader ("Cache-Control", "no-store");
        response.setHeader ("Pragma", "no-cache");
        response.setDateHeader ("Expires", 0);
        responseOutputStream.flush ();
        responseOutputStream.close ();
    }
    @GetMapping("/base64Captcha")
    @ApiOperation("生成图片验证码")
    public BaseResponse<String> base64Captcha (HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedImage image = verificationCodeService.genCaptcha();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();//io流
        // 输出图象到页面
        ImageIO.write (image, "JPEG", baos);
        byte[] bytes = baos.toByteArray();//转换成字节
        BASE64Encoder encoder = new BASE64Encoder();
        String png_base64 =  encoder.encodeBuffer(bytes).trim();//转换成base64串
        png_base64 = png_base64.replaceAll("\n", "").replaceAll("\r", "");//删除 \r\n
        png_base64 = "data:image/png;base64,"+png_base64;
        return new BaseResponse(png_base64,"成功");
    }


}
