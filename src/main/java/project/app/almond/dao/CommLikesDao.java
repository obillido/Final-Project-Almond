package project.app.almond.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.CommLikesVo;

@Repository
public class CommLikesDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.CommLikesMapper";
	public int insert(CommLikesVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int update(CommLikesVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".update",vo);
	}
	public CommLikesVo isExist(CommLikesVo vo){
		return sqlSessionTemplate.selectOne(NAMESPACE+".isExist",vo);
	}
}
