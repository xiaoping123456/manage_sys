package com.mushan.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(value = "com.mushan") //扫描路径
@MapperScan("com.mushan.dao.*")
public class MushanAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(MushanAdminApplication.class, args);
    }

}
