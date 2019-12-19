package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.GiftDao;
import project.app.almond.vo.GiftHistoryVo;
import project.app.almond.vo.GiftVo;
import project.app.almond.vo.WebcontentsVo;

@Service
public class GiftService {
	@Autowired private GiftDao giftDao;
	public int giftinsert(GiftVo vo){
		return giftDao.giftinsert(vo);
	}
	public List<WebcontentsVo> list(int cultype){
		return giftDao.list(cultype);
	}

	
}
