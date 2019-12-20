package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.GiftDao;
import project.app.almond.dao.TicketStockDao;
import project.app.almond.dao.UsersDao;
import project.app.almond.vo.GiftHistoryVo;
import project.app.almond.vo.GiftVo;
import project.app.almond.vo.WebcontentsVo;

@Service
public class GiftService {
	@Autowired private GiftDao giftDao;
	@Autowired private TicketStockDao tsdao;
	@Autowired private UsersDao udao;
	public int giftinsert(GiftVo vo){
		return giftDao.giftinsert(vo);
	}
	public List<HashMap<String, Object>> getList(int usernum){
		return giftDao.getList(usernum);
	}
	public int inserthistory(GiftHistoryVo vo){
		return giftDao.inserthistory(vo);
	}
	
}
