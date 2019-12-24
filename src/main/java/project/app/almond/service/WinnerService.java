package project.app.almond.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.WinnerDao;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Service
public class WinnerService {
	@Autowired private WinnerDao wdao;
	
	public int count(int eventnum){//몇명이 존재하는지확인
		return wdao.count(eventnum);
	}
	public int check(WinnerVo vo ){//참여유무
		return wdao.check(vo);
	}
	public List<UsersVo> select(int eventnum){//명단 가져오기
		return wdao.winnerselect(eventnum);
	}
	public int insert(WinnerVo vo){//인서트
		return wdao.winner(vo);
	}
	public List<WinnerVo> whoList(int eventnum){//룰렛돌릴수있는사람 가져오기
		
		return wdao.whoList(eventnum);
	}
}
