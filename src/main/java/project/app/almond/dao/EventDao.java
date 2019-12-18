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
	public List<CommentsEpisodeVo> event3(){//이벤트3 댓글 당첨자 리스트
		return session.selectList(NAMESPACE+".event3");
	}
	public List<ReadingEpisodeVo> event3reading(){//이벤트 3열람 당첨자 리스트 
		return session.selectList(NAMESPACE+".event3reading");
	}
	public int rullCash(UsersVo vo){//룰렛 돌린 당첨자...
		return session.update(NAMESPACE+".rullcash",vo);
	}
	
	
}
