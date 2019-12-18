package project.app.almond.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.AlarmVo;

@Repository
public class AlarmDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.app.almond.AlarmMapper";
	
	public int insert(AlarmVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
}
