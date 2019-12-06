package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.EpisodeVo;

@Repository
public class EpisodeDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.EpisodeMapper";
	public int insert(EpisodeVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int getEpnum(int contnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getEpnum",contnum);
	}
	public List<EpisodeVo> getList(int contnum){
		return sqlSessionTemplate.selectList(NAMESPACE+".getList",contnum);
	}
}
