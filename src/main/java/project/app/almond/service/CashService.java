package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.CashDao;
import project.app.almond.vo.CashVo;
import project.app.almond.vo.TicketBuyVo;

@Service
public class CashService {
	@Autowired private CashDao dao;
    public int insert(CashVo vo){
    	return dao.insert(vo);
    }
    public int totCharge(int usernum){
    	return dao.totCharge(usernum);
    }
    public List<CashVo> list(int usernum){
    	return dao.list(usernum);
    }
    public int updateCharge(HashMap<String, Object> map){
    	return dao.updateCharge(map);
    }
    public int totCash(int usernum){
    	return dao.totCash(usernum);
    }
    public List<TicketBuyVo> listUse(int usernum){
    	return dao.listUse(usernum);
    }
    public int totUse(int usernum){
    	return dao.totUse(usernum);
    }
}
