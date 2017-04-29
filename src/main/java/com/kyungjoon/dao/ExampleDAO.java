/*package com.example.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ExampleDAO {
	@Select("select * from blogs order by id desc limit 1")
	HashMap getBlog();
}
*/

package com.kyungjoon.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kyungjoon.model.Blog;

@Repository
public class ExampleDAO {
	@Autowired
	@Qualifier("firstSqlSessionTemplate")
	private SqlSession sqlSession;

	public List getBlog() {

		List<Blog> arrList = sqlSession.selectList("com.kyungjoon.mapper.ExampleMapper.getBlog");

		for (Blog blog : arrList) {
			
			String id = blog.getId();
			String name = blog.getName();
			
			System.out.println("name:"+ name);
			System.out.println("id:"+ id);

		}

		return arrList;
	}
}
