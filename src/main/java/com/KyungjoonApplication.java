package com;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author sample
 */
/*
@SpringBootApplication
public class KyungjoonApplication extends SpringBootServletInitializer {
   */
/* @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(KyungjoonApplication.class);
    }


    public static void main(String[] args) throws Exception {

        System.setProperty("spring.devtools.restart.enabled", "true");
        SpringApplication.run(KyungjoonApplication.class, args);
    }*//*


   */
/* @Bean
    public WebMvcConfigurerAdapter webMvcConfigurerAdapter() {
        return new WebMvcConfigurerAdapter() {
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(new KyungjoonLoginIntercepter()).addPathPatterns("*");
            }
        };
    }*//*





}*/


@Configuration
@EnableAutoConfiguration
@ComponentScan
public class KyungjoonApplication extends SpringBootServletInitializer {
	
	public KyungjoonApplication() {
	    super();
	    setRegisterErrorPageFilter(false); // <- this one
	}

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(KyungjoonApplication.class);
    }
}