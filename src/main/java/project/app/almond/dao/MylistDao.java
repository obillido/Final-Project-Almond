package project.app.almond.dao;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.MylistVo;

@Repository
public class MylistDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.MylistMapper";
	public int insert(MylistVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int update(Date readingdate){
		return sqlSessionTemplate.update(NAMESPACE+".update",readingdate);
	}
	public int delete(MylistVo vo){
		return sqlSessionTemplate.delete(NAMESPACE+".delete",vo);
	}
	public MylistVo isExist(MylistVo vo){
		return sqlSessionTemplate.selectOne(NAMESPACE+".isExist",vo);
	}
}
