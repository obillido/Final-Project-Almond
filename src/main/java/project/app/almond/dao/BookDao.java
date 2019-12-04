package project.app.almond.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.BookVo;

@Repository
public class BookDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.app.almond.BookMapper";
	public int insert(BookVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
}
