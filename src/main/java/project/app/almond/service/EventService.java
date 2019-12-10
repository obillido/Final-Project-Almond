package project.app.almond.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.EventDao;
import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;

@Service
public class EventService {
	@Autowired private EventDao edao;
	public int updateCash(UsersVo vo){
		edao.updateCash(vo);
		return 1;
	}
	public List<ReadingEpisodeVo> event2(){
		return edao.event2();
	}
	public List<CommentsEpisodeVo> event3(){
		return edao.event3();
	}
	public List<ReadingEpisodeVo> event3reading(){
		return edao.event3reading();
	}
	public int rullcash(UsersVo vo){
		edao.rullCash(vo);
		return 1;
	}
}
