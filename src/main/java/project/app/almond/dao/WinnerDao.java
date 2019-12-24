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

	public int winner(WinnerVo vo){//�������̺� ����
		return session.insert(NAMESPACE+".winner",vo);
	}
	public int count(int eventnum){//�ش��̺�Ʈ ��÷�� ������� Ȯ��
		return session.selectOne(NAMESPACE+".count",eventnum);
	}
	public int check(WinnerVo vo){//�ش��̺�Ʈ �����ߴ���
		return session.selectOne(NAMESPACE+".check",vo);
	}
	public List<UsersVo> winnerselect(int eventnum){//�ش� ��÷�� �̱�
		return session.selectList(NAMESPACE+".winnerselect",eventnum);
	}
	public List<WinnerVo> whoList(int eventnum){//�귿�������ִ»��
		return session.selectList(NAMESPACE+".whoList",eventnum);
	}
	
	public WinnerVo isExist(WinnerVo vo){
		return session.selectOne(NAMESPACE+".isExist",vo);
	}
}
