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
	public List<AlarmVo> getList(int usernum){
		return adao.getList(usernum);
	}
	public int getCnt(int usernum){
		return adao.getCnt(usernum);
	}
}
