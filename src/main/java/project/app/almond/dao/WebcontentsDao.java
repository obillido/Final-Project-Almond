package project.app.almond.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.WebcontentsVo;

@Repository
public class WebcontentsDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.WebcontentsMapper";
	public int insert(WebcontentsVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int getCurrContnum(){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getCurrContnum");
	}
}
