package com.tinkerbell.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class TinkerbellDao {

    @Autowired
    private JdbcTemplate template;


    public List getDataList() {
        List arrList = template.queryForList("SELECT * FROM test1 ORDER BY id DESC");

        return arrList;
    }


    public int insertDataList(List<HashMap> excelDataList) {

        int result = 0;
        for (HashMap elementOne : excelDataList) {

            String query = (String) elementOne.get("query");
            String query_answer = (String) elementOne.get("query");

            result = template.update("INSERT INTO test1 ( name, query_answer) VALUES ( ?, ?)", query, query_answer);
        }


        return result;
    }

    public int deleteDataList(String[] ids) {

        int result= 0;
        for ( String id : ids){
            result = template.update("delete from test1 where id=?", id);
        }

        return result;
    }


}