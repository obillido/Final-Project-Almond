package project.app.almond.dao;

import java.util.HashMap;
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

	public int winner(WinnerVo vo){//위너테이블에 삽입
		return session.insert(NAMESPACE+".winner",vo);
	}
	public int count(int eventnum){//해당이벤트 당첨자 몇명인지 확인
		return session.selectOne(NAMESPACE+".count",eventnum);
	}
	public int check(WinnerVo vo){//해당이벤트 참여했는지
		return session.selectOne(NAMESPACE+".check",vo);
	}
	public List<UsersVo> winnerselect(int eventnum){//해당 당첨자 뽑기
		return session.selectList(NAMESPACE+".winnerselect",eventnum);
	}
	public List<WinnerVo> whoList(int eventnum){//룰렛돌릴수있는사람
		return session.selectList(NAMESPACE+".whoList",eventnum);
	}
	
	public WinnerVo isExist(WinnerVo vo){
		return session.selectOne(NAMESPACE+".isExist",vo);
	}
}
