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
	
	public int event4cash(int usernum){//해당 유저 캐시업데이트
		return session.update(NAMESPACE+".event4cash",usernum);
	}
	public List<Event2Vo> event2(int eventnum){//이벤트2 당첨자 뽑기
		return session.selectList(NAMESPACE+".event2",eventnum);
	}
	public List<WinnerVo> event3comments(int eventnum){//이벤트3 댓글 당첨자 리스트
		return session.selectList(NAMESPACE+".event3comments");
	}
	public int event3cash(WinnerVo vo){//이벤트3 당첨자한테 캐시 만원주기
		return session.update(NAMESPACE+".event3cash",vo);
	}
	public List<WinnerVo> event3reading(int eventnum2){//이벤트 3열람 당첨자 리스트 
		return session.selectList(NAMESPACE+".event3reading");
	}
	public int event5cash(UsersVo vo){//룰렛돌린애들 금액 업데이트
		return session.update(NAMESPACE+".event5cash",vo);
	}
	
}
