package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.AlarmVo;

@Repository
public class AlarmDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.AlarmMapper";
	
	public int insert(AlarmVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public List<AlarmVo> getWebList(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE+".getWebList",usernum);
	}
	public List<AlarmVo> getCommList(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE+".getCommList",usernum);
	}
	public List<AlarmVo> getEventList(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE+".getEventList",usernum);
	}
	public int getCnt(int usernum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getCnt",usernum);
	}
	public int update(int alarmnum){
		return sqlSessionTemplate.update(NAMESPACE+".update",alarmnum);
	}
}
