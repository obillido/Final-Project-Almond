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
	
	public int count(int eventnum){//����� �����ϴ���Ȯ��
		return wdao.count(eventnum);
	}
	public int check(WinnerVo vo ){//��������
		return wdao.check(vo);
	}
	public List<UsersVo> select(int eventnum){//��� ��������
		return wdao.winnerselect(eventnum);
	}
	public int insert(WinnerVo vo){//�μ�Ʈ
		return wdao.winner(vo);
	}
	public List<WinnerVo> whoList(int eventnum){//�귿�������ִ»�� ��������
		
		return wdao.whoList(eventnum);
	}
}
