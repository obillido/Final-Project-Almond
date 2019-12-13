package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.TicketUseVo;


@Repository
public class TicketUseDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.TicketUseMapper";
	public List<HashMap<String, Object>> history(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".history" , usernum);
	}
	public int insert(TicketUseVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
}
