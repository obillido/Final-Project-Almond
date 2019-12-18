package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.Event2Vo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Repository
public class EventDao {
	@Autowired private SqlSessionTemplate session;
	private final String NAMESPACE="project.mybatis.mapper.EventMapper";
	
	public int event4cash(int usernum){//�ش� ���� ĳ�þ�����Ʈ
		return session.update(NAMESPACE+".event4cash",usernum);
	}
	public List<Event2Vo> event2(int eventnum){//�̺�Ʈ2 ��÷�� �̱�
		return session.selectList(NAMESPACE+".event2",eventnum);
	}
	public List<CommentsEpisodeVo> event3(){//�̺�Ʈ3 ��� ��÷�� ����Ʈ
		return session.selectList(NAMESPACE+".event3");
	}
	public List<ReadingEpisodeVo> event3reading(){//�̺�Ʈ 3���� ��÷�� ����Ʈ 
		return session.selectList(NAMESPACE+".event3reading");
	}
	public int rullCash(UsersVo vo){//�귿 ���� ��÷��...
		return session.update(NAMESPACE+".rullcash",vo);
	}
	
	
}
