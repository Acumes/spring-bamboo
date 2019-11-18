package com.bamboo.config.email;

import com.sun.mail.util.MailSSLSocketFactory;
import freemarker.template.Template;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.mail.*;
import javax.mail.internet.*;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

@Data
@Service
public class JavaEmailService {
    private String email;
    private String subject;
    private String template;
    private Map<String, Object> map;

    @Value("${spring.mail.username}")
    private String sender;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    public void sendTemplateMail(String toEmail, String subject, Map<String, Object> map, String templateHtml) {
        MimeMessage message = null;
        try {
            message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, false, "utf8");
            helper.setFrom(new InternetAddress(sender));
            helper.setTo(new InternetAddress(toEmail));
//            helper.setSubject(subject);
            helper.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
            // 设置多个密送地址
            InternetAddress[] internetAddressBCC = new InternetAddress().parse("295277302@qq.com");
            message.setRecipients(Message.RecipientType.CC, internetAddressBCC);

            //读取 html 模板
            Template template = freeMarkerConfigurer.getConfiguration().getTemplate(templateHtml);
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
            helper.setText(html, true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mailSender.send(message);
    }
}
