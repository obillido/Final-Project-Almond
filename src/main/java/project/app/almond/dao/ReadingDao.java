package project.app.almond.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.ReadingVo;

@Repository
public class ReadingDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.ReadingMapper";
	public int insert(ReadingVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int update(ReadingVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".update",vo);
	}
	public Integer getRemainingWaitingTime(HashMap<String, Object> map){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getRemainingWaitingTime",map);
	}
}
