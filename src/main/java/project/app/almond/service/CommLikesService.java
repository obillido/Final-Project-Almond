package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.CommLikesDao;
import project.app.almond.vo.CommLikesVo;

@Service
public class CommLikesService {
	@Autowired private CommLikesDao cdao;
	public int insert(CommLikesVo vo){
		return cdao.insert(vo);
	}
	public int update(CommLikesVo vo){
		return cdao.update(vo);
	}
	public CommLikesVo isExist(CommLikesVo vo){
		return cdao.isExist(vo);
	}
}
