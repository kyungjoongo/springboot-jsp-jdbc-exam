package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.BlogDao;



/**
 * CRUD 컨트롤러 example
 * @author kyungjoon
 *
 */
/*@RestController*/

@Controller
public class CRUDController {
 
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
        
        
        blogDao.insertNewContent("고경준은 관연천재님이신가요?2222?");
        return "Greetings from Spring Boot!";
    }
    
    
    @RequestMapping("/insertTest2")
    public String insertTest2() {
        blogDao.insertNewContent("고경준은 관연천재님이신가요----------1");
        
        
        blogDao.insertNewContent("고경준은 관연천재님이신가요?---------2?");
        
        
        blogDao.insertNewContent("고경준은 관연천재님이신가요?---------3?");
        
        blogDao.insertNewContent("고경준은 관연천재님이신가요?---------3?");
        
        
        blogDao.insertNewContent("고경준은 관연천재님이신가요?---------4?");
        blogDao.insertNewContent("고경준은 관연천재님이신가요?---------4?");
        blogDao.insertNewContent("고경준은 관연천재님이신가요?---------4?");
        
        blogDao.insertNewContent("고경준은 관연천재님이신가요?---------4?");
        
        blogDao.insertNewContent("고경준은 관연천재님이신가요?---------4?");
        
        
        return "Greetings from Spring Boot!";
    }
    
    
    @RequestMapping("/selectTest")
	public String selectTest(Model model,	@RequestParam(value = "name", required = false, defaultValue = "Stranger") String name) {
		
    	List arrList = blogDao.selecContents(null);
    	
    	model.addAttribute("arrList",arrList);
		
		
		return "selectTest";
	}

    
  
  
 
 
}


