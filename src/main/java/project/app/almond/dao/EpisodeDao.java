package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.EpisodeReadingVo;
import project.app.almond.vo.EpisodeVo;
import project.app.almond.vo.WebcontentsVo;

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
	public List<EpisodeReadingVo> getListforUser(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".getListforUser",map);
	}
	public EpisodeVo getInfo(int epinum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo",epinum);
	}
	public int addHit(int epinum){
		return sqlSessionTemplate.update(NAMESPACE+".addHit",epinum);
	}
	public EpisodeVo getLastRead(HashMap<String, Object> map){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getLastRead",map);
	}
	public EpisodeVo getFirstEpi(int contnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getLastRead",contnum);
	}
	public int getTotalEpisodeCnt(int contnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getTotalEpisodeCnt",contnum);
	}
	public int userReadCnt(HashMap<String, Object> map){
		return sqlSessionTemplate.selectOne(NAMESPACE+".userReadCnt",map);
	}
}
