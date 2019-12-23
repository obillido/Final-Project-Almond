package project.app.almond.service;

import java.util.List;

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
	public List<AlarmVo> getWebList(int usernum){
		return adao.getWebList(usernum);
	}
	public List<AlarmVo> getCommList(int usernum){
		return adao.getCommList(usernum);
	}
	public List<AlarmVo> getEventList(int usernum){
		return adao.getEventList(usernum);
	}
	public int getCnt(int usernum){
		return adao.getCnt(usernum);
	}
	public int update(int alarmnum){
		return adao.update(alarmnum);
	}
}
