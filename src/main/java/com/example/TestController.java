package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
 
    @Autowired
    private BlogDao blogDao;
 
    @RequestMapping("/")
    public String index() {
        blogDao.insertNewContent("Hello Spring?");
        return "Greetings from Spring Boot!";
    }
    
    
    @RequestMapping("/insertTest")
    public String insertTest() {
        blogDao.insertNewContent("고경준은 관연천재님이신가요??");
        return "Greetings from Spring Boot!";
    }
    
  
 
 
}