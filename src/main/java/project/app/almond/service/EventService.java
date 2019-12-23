package project.app.almond.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.annotation.SessionScope;

import project.app.almond.dao.EventDao;
import project.app.almond.dao.EventHistoryDao;
import project.app.almond.dao.WinnerDao;
import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.Event2Vo;
import project.app.almond.vo.EventHistoryVo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Service
public class EventService {
	@Autowired private EventDao edao;
	@Autowired private WinnerDao wdao;
	@Autowired private EventHistoryDao ehdao;
	
	public void setEventDao(EventDao eventDao){
		this.edao=eventDao;
	}



	@Transactional
	public int event2(int eventnum){
		List<Event2Vo> list=edao.event2(eventnum);
		for(int i=0;i<list.size();i++){
			wdao.winner(new WinnerVo(0, eventnum, list.get(i).getUsernum()));
		}
		return 1;
	}
	@Transactional
	public int event3comments(int eventnum){
		List<WinnerVo> list=edao.event3comments(eventnum);
		for(int i=0;i<list.size();i++){
			wdao.winner(new WinnerVo(0,eventnum, list.get(i).getUsernum()));
		}
		return 1;
	}
	//3 댓글추첨자들 만원씩
	@Transactional
	public int event3cash(WinnerVo vo,int eventnum){
		List<UsersVo> list=wdao.winnerselect(eventnum);
		for(int i=0;i<list.size();i++){
			int n=edao.event3cash(new WinnerVo(0,eventnum,list.get(i).getUsernum()));
		}
		return 1;
	}
	@Transactional
	public int event3reading(int eventnum2){
		List<WinnerVo> list=edao.event3reading(eventnum2);
		for(int i=0;i<list.size();i++){
			wdao.winner(new WinnerVo(0,eventnum2, list.get(i).getUsernum()));
		}
		return 1;
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
	public int event5(int usernum,int eventnum,int price){
		edao.event5cash(new UsersVo(usernum,null,null,null,null,null,price,0));//캐시업데이트(돌린사람 업데이트)
		ehdao.eventhistory(new EventHistoryVo(0,eventnum,usernum,null,price));//이벤트히스토리에 인서트
		return 1;
	}
}
