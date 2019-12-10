package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.CashVo;
import project.app.almond.vo.TicketBuyVo;


@Repository
public class CashDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.CashMapper";
	public int insert(CashVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int totCharge(int usernum){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".totCharge",usernum);
	}
	public List<CashVo> list(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list",usernum);
	}
	public int updateCharge(HashMap<String, Object> map){
		return sqlSessionTemplate.update(NAMESPACE + ".updateCharge",map);
	}
	public int totCash(int usernum){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".totCash",usernum);
	}
	public List<TicketBuyVo> listUse(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".listUse",usernum);
	}
	public int totUse(int usernum){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".totUse",usernum);
	}
}
