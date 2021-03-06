package com.sample.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BlogDao {
 
    @Autowired
    private JdbcTemplate template;
 
    public void insertNewContent(String content) {
        template.update("INSERT INTO blogs(content) VALUES(?)", content);
    }
    
    
    public void insertNewContentTest(String content) {
        template.update("INSERT INTO blogs(content) VALUES(?)", content);
    }
    
    public List selecContents(String content) {
        List arrList = template.queryForList("select * from blogs limit 1, 30");
        
        return arrList;
    }
    
    
    public List getGraphData() {
        List arrList = template.queryForList("select * from test1");
        
        return arrList;
    }
    
    
    
}