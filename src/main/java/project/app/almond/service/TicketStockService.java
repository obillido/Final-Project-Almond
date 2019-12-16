package project.app.almond.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.TicketStockDao;
import project.app.almond.vo.TicketStockVo;

@Service
public class TicketStockService {
	@Autowired TicketStockDao tdao;
	public TicketStockVo getInfo(TicketStockVo vo){
		return tdao.getInfo(vo);
	}
	public int getTicketCnt(HashMap<String, Object> map){
		return tdao.getTicketCnt(map);
	}
}
