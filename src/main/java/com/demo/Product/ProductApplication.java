package com.demo.Product;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ProductApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ProductApplication.class, args);
    }
}
