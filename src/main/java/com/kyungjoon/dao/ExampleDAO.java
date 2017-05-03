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

import com.kyungjoon.model.Blog;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class ExampleDAO {
	@Autowired
	@Qualifier("firstSqlSessionTemplate")
	private SqlSession sqlSession;

	public List getBlog() {

		List<Blog> arrList = sqlSession.selectList("com.kyungjoon.mapper.ExampleMapper.getBlog");
		return arrList;
	}

	/**
	 * 유저의 존재여부를 리턴.
	 * @param userMap
	 * @return
	 */
	public Boolean getUser(HashMap userMap) {

		int userCnt= sqlSession.selectOne("com.kyungjoon.mapper.ExampleMapper.getUser", userMap);

		if (userCnt>0){
			return true;
		}else{
			return false;
		}
	}
}
