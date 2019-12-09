package project.app.almond.dao;

import java.util.HashMap;
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
	public List<EpisodeVo> getList(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".getList",map);
	}
	public EpisodeVo getInfo(int epinum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo",epinum);
	}
	public int addHit(int epinum){
		return sqlSessionTemplate.update(NAMESPACE+".addHit",epinum);
	}
}
