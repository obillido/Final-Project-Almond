package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Repository
public class WinnerDao {
	@Autowired private SqlSessionTemplate session;
	private final String NAMESPACE="project.mybatis.mapper.WinnerMapper";

	public int winner(WinnerVo vo){
		return session.insert(NAMESPACE+".winner",vo);
	}
	public int check(int eventnum){
		return session.selectOne(NAMESPACE+".check",eventnum);
	}
	public List<UsersVo> winnerselect(int eventnum){
		return session.selectList(NAMESPACE+".winnerselect",eventnum);
	}
	
}
