package com.sample.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
@ComponentScan(basePackages = {"com.sample",})
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private HttpInterceptor httpinterceptor;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
/*
        registry.addInterceptor(httpinterceptor)
        .addPathPatterns("/login/**");*/

    }
}