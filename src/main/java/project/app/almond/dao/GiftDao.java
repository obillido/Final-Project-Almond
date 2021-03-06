package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.GiftHistoryVo;
import project.app.almond.vo.GiftVo;
import project.app.almond.vo.WebcontentsVo;

@Repository
public class GiftDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.GiftMapper";
	public int giftinsert(GiftVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".giftinsert", vo);
	}
	public int insertbox(GiftHistoryVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".insertbox", vo);
	}

	public List<HashMap<String, Object>> getList(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".getList", usernum);
	}
	public int inserthistory(GiftHistoryVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".inserthistory", vo);
	}
	public GiftVo getInfo(int giftnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo",giftnum);
	}
}
