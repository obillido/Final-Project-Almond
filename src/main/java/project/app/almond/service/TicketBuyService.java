package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.TicketBuyDao;
import project.app.almond.dao.TicketStockDao;
import project.app.almond.dao.UsersDao;
import project.app.almond.vo.TicketBuyVo;
import project.app.almond.vo.TicketStockVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WebcontentsVo;

@Service
public class TicketBuyService {
	@Autowired private TicketBuyDao ticketBuyDao;
	@Autowired private TicketStockDao tsdao;
	@Autowired private UsersDao udao;
	public UsersVo getinfo(int usernum){
		return ticketBuyDao.getinfo(usernum);
	}
	@Transactional
	public int insert(TicketBuyVo vo){
		ticketBuyDao.insert(vo);
		TicketStockVo tksvo=new TicketStockVo(0, vo.getUsernum(), vo.getContnum(), vo.getType(), vo.getCnt());
		if(tsdao.getInfo(tksvo)==null){
			tsdao.insert(tksvo);
		}else{
			tsdao.updateAdd(tksvo);
		}
		udao.updateCashSub(new UsersVo(vo.getUsernum(), null, null, null, null, null, vo.getPrice(), 0));
		return 1;
	}
	public List<HashMap<String, Object>> history(int usernum){
		return ticketBuyDao.history(usernum);
	}

	/*
	public TicketBuyVo ticketType(TicketBuyVo vo){
		return ticketBuyDao.ticketType(vo);
	}	
	*/
	
}
