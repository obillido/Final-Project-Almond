package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.TicketBuyDao;
import project.app.almond.dao.TicketStockDao;
import project.app.almond.dao.UsersDao;
import project.app.almond.vo.TicketBuyVo;
import project.app.almond.vo.TicketStockVo;
import project.app.almond.vo.UsersVo;

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
		System.out.println("111");
		ticketBuyDao.insert(vo);
		System.out.println("111");
		TicketStockVo tksvo=tsdao.getInfo(new TicketStockVo(0, vo.getUsernum(), vo.getContnum(), vo.getType(), vo.getCnt()));
		if(tksvo==null){
			tsdao.insert(tksvo);
		}else{
			tsdao.updateAdd(tksvo);
		}
		System.out.println("111");
		udao.updateCashSub(new UsersVo(vo.getUsernum(), null, null, null, null, null, vo.getPrice(), 0));
		System.out.println("111");
		return 1;
	}
}
