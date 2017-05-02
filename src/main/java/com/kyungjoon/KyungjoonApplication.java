package com.kyungjoon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;


/**
 * 
 * @author kyungjoon
 *
 */
@SpringBootApplication
public class KyungjoonApplication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(KyungjoonApplication.class);
    }



    public static void main(String[] args) throws Exception {
    	
    	System.setProperty("spring.devtools.restart.enabled", "true");
        SpringApplication.run(KyungjoonApplication.class, args);
    }
}