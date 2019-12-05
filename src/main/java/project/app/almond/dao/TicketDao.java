package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.TicketVo;

@Repository
public class TicketDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.TicketMapper";
	public List<TicketVo> getInfoList(int cultype){
		return sqlSessionTemplate.selectList(NAMESPACE+".getInfoList",cultype);
	}
	public TicketVo getInfo(int tknum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo",tknum);
	}
}
