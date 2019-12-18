package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.AlarmDao;
import project.app.almond.vo.AlarmVo;

@Service
public class AlarmService {
	@Autowired private AlarmDao adao;
	
	public int insert(AlarmVo vo){
		return adao.insert(vo);
	}
}
