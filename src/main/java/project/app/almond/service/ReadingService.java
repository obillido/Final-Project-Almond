package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.ReadingDao;
import project.app.almond.vo.ReadingVo;

@Service
public class ReadingService {
	@Autowired private ReadingDao rdao;
	public int insert(ReadingVo vo){
		return rdao.insert(vo);
	}
	public int update(ReadingVo vo){
		return rdao.update(vo);
	}
}
