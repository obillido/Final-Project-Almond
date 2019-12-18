package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.GiftVo;
import project.app.almond.vo.WebcontentsVo;

@Repository
public class GiftDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.GiftMapper";
	public int giftinsert(GiftVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".giftinsert", vo);
	}
	public List<WebcontentsVo> list(int cultype){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list", cultype);
	}
}
