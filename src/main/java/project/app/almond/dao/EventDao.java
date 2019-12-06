package project.app.almond.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.UsersVo;

@Repository
public class EventDao {
	@Autowired private SqlSessionTemplate session;
	private final String NAMESPACE="project.mybatis.mapper.EventMapper";
	
	public int updateCash(UsersVo vo){
		return session.update(NAMESPACE+".updateCash",vo);
	}
}
