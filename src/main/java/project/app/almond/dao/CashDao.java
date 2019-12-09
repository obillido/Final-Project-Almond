package project.app.almond.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.CashVo;


@Repository
public class CashDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.CashMapper";
	public int insert(CashVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
}
