package com.example;

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
public class Demo1Application extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Demo1Application.class);
    }

    public static void main(String[] args) throws Exception {
    	
    	System.setProperty("spring.devtools.restart.enabled", "true");
        SpringApplication.run(Demo1Application.class, args);
    }
}
