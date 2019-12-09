package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.CashDao;
import project.app.almond.vo.CashVo;

@Service
public class CashService {
	@Autowired private CashDao dao;
    public int insert(CashVo vo){
    	return dao.insert(vo);
    }
}
