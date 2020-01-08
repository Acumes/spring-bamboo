package com.bamboo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author: acumes
 * @create: 2020-01-07 21:14:02
 * @description:
 */
@SpringBootApplication
@EnableScheduling
public class BambooJobApplication {

    public static void main(String[] args) {
        SpringApplication.run(BambooJobApplication.class,args);
    }
}
