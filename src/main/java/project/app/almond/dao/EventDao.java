package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;

@Repository
public class EventDao {
	@Autowired private SqlSessionTemplate session;
	private final String NAMESPACE="project.mybatis.mapper.EventMapper";
	
	public int updateCash(UsersVo vo){
		return session.update(NAMESPACE+".updateCash",vo);
	}
	public List<ReadingEpisodeVo> event2(){		
		return session.selectList(NAMESPACE+".event2");
	}
	public List<CommentsEpisodeVo> event3(){
		return session.selectList(NAMESPACE+".event3");
	}
	public List<ReadingEpisodeVo> event3reading(){
		return session.selectList(NAMESPACE+".event3reading");
	}
	public int rullCash(UsersVo vo){
		return session.update(NAMESPACE+".rullcash",vo);
	}
	
}
