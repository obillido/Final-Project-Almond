package project.app.almond.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.annotation.SessionScope;

import project.app.almond.dao.EventDao;
import project.app.almond.dao.WinnerDao;
import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.Event2Vo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Service
public class EventService {
	@Autowired private EventDao edao;
	@Autowired private WinnerDao wdao;
	
	public void setEventDao(EventDao eventDao){
		this.edao=eventDao;
	}
	
	
	
	
	
	@Transactional
	public int event4(UsersVo vo,int eventnum,HttpSession session){//scope로 유저번호 넘기기..?
		int usernum;
		Object un=session.getAttribute("usernum");
		if(un!=null){
			usernum=(Integer)un;
			wdao.winner(new WinnerVo(0, eventnum, usernum));
			edao.event4cash(usernum);
		}			 
		return 1;	
	}

	
	
	
	
	
	
	
	
	@Transactional
	public int event2(int eventnum){
		List<Event2Vo> list=edao.event2(eventnum);
		for(int i=0;i<list.size();i++){
			wdao.winner(new WinnerVo(0, eventnum, list.get(i).getUsernum()));
		}
		return 1;
	}

	public List<CommentsEpisodeVo> event3(){
		return edao.event3();
	}
	public List<ReadingEpisodeVo> event3reading(){
		return edao.event3reading();
	}

	//
	@Transactional
	public int rullcash(UsersVo vo){
		edao.rullCash(vo);
		return 1;
	}
	
}
