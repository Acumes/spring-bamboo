package com.bamboo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

/**
 * @author: acumes
 * @create: 2019-11-04 10:34:27
 * @description:
 */
@SpringBootApplication
public class BambooWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(BambooWebApplication.class,args);
    }
}
