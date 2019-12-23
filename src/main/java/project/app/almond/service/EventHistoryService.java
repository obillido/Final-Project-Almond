package project.app.almond.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.EventHistoryDao;
import project.app.almond.vo.EventHistoryVo;


@Service
public class EventHistoryService {
	@Autowired private EventHistoryDao ehdao;
	//�̺�Ʈ�����丮�� �μ�Ʈ
	public int eventHistory(EventHistoryVo vo){
		return ehdao.eventhistory(vo);
	}
	//�̺�Ʈ�����丮�� �ִ� �ֵ� ����Ʈ�� �̱�
	public List<EventHistoryVo> historyList(int usernum){
		return ehdao.roulList(usernum);
	}
	
}
