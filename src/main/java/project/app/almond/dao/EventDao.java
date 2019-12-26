package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.Event2Vo;
import project.app.almond.vo.EventVo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Repository
public class EventDao {
	@Autowired private SqlSessionTemplate session;
	private final String NAMESPACE="project.mybatis.mapper.EventMapper";
	
	public int event4cash(UsersVo vo){//�ش� ���� ĳ�þ�����Ʈ
		return session.update(NAMESPACE+".event4cash",vo);
	}
	public List<Event2Vo> event2(int eventnum){//�̺�Ʈ2 ��÷�� �̱�
		return session.selectList(NAMESPACE+".event2",eventnum);
	}
	public List<WinnerVo> event3comments(int eventnum){//�̺�Ʈ3 ��� ��÷�� ����Ʈ
		return session.selectList(NAMESPACE+".event3comments");
	}
	public int event3cash(WinnerVo vo){//�̺�Ʈ3 ��÷������ ĳ�� �����ֱ�
		return session.update(NAMESPACE+".event3cash",vo);
	}
	public List<WinnerVo> event3reading(int eventnum2){//�̺�Ʈ 3���� ��÷�� ����Ʈ 
		return session.selectList(NAMESPACE+".event3reading");
	}
	public int event5cash(UsersVo vo){//�귿�����ֵ� �ݾ� ������Ʈ
		return session.update(NAMESPACE+".event5cash",vo);
	}
	
	public int insertKeyword(EventVo vo){
		return session.insert(NAMESPACE+".insertKeyword",vo);
	}
	public int insertRoulette(EventVo vo){
		return session.insert(NAMESPACE+".insertRoulette",vo);
	}
	public int insertSortition(EventVo vo){
		return session.insert(NAMESPACE+".insertSortition",vo);
	}
	public int insertReview(EventVo vo){
		return session.insert(NAMESPACE+".insertReview",vo);
	}
	
	public List<HashMap<String, Object>> getList(){
		return session.selectList(NAMESPACE+".getList");
	}
	
	public EventVo getInfo(int eventnum){
		return session.selectOne(NAMESPACE+".getInfo",eventnum);
	}
	
	
	public List<EventVo> getShowList(){
		return session.selectList(NAMESPACE+".getShowList");
	}
}
