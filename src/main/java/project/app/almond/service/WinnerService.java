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
	public int check(int eventnum){//����� �����ϴ���Ȯ��
		return wdao.check(eventnum);
	}
	public List<UsersVo> select(int eventnum){//��� ��������
		return wdao.winnerselect(eventnum);
	}
	public int insert(WinnerVo vo){
		return wdao.winner(vo);
	}
}
