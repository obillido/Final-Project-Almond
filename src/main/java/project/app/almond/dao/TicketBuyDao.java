package project.app.almond.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.TicketBuyVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WebcontentsVo;


@Repository
public class TicketBuyDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.TicketBuyMapper";
	public UsersVo getinfo(int usernum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getinfo",usernum);
	}
	public int insert(TicketBuyVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".insert", vo);
	}
	public List<HashMap<String, Object>> history(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".history", usernum);
	}

	/*
	public TicketBuyVo ticketType(TicketBuyVo vo){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".ticketType", vo);
	}
	*/
	
}
