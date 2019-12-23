package project.app.almond.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.EventHistoryDao;
import project.app.almond.vo.EventHistoryVo;


@Service
public class EventHistoryService {
	@Autowired private EventHistoryDao ehdao;
	//이벤트히스토리에 인서트
	public int eventHistory(EventHistoryVo vo){
		return ehdao.eventhistory(vo);
	}
	//이벤트히스토리에 있는 애들 리스트로 뽑기
	public List<EventHistoryVo> historyList(int usernum){
		return ehdao.roulList(usernum);
	}
	
}
