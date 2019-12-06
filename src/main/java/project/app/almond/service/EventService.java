package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.EventDao;
import project.app.almond.vo.UsersVo;

@Service
public class EventService {
	@Autowired private EventDao edao;
	public int updateCash(UsersVo vo){
		edao.updateCash(vo);
		return 1;
	}
}
