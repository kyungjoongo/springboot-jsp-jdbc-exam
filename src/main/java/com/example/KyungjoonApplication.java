package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


/**
 * 
 * @author kyungjoon
 *
 */
/*@SpringBootApplication
public class KyungjoonApplication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(KyungjoonApplication.class);
    }

    public static void main(String[] args) throws Exception {
    	
    	System.setProperty("spring.devtools.restart.enabled", "true");
        SpringApplication.run(KyungjoonApplication.class, args);
    }
}*/

@Configuration
@EnableAutoConfiguration
@ComponentScan
public class KyungjoonApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(KyungjoonApplication.class);
    }
}



