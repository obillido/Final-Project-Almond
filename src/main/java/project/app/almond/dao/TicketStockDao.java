package project.app.almond.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.TicketStockVo;

@Repository
public class TicketStockDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.TicketStockMapper";
	public int insert(TicketStockVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert", vo);
	}
	public int updateAdd(TicketStockVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".updateAdd",vo);
	}
	public int updateSub(TicketStockVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".updateSub",vo);
	}
	public TicketStockVo getInfo(TicketStockVo vo){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo", vo);
	}
	public int getTicketCnt(HashMap<String, Object> map){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getTicketCnt",map);
	}
}
