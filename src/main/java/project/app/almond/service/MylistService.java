package project.app.almond.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.MylistDao;
import project.app.almond.vo.MylistVo;

@Service
public class MylistService {
	@Autowired private MylistDao mdao;
	public int insert(MylistVo vo){
		return mdao.insert(vo);
	}
	public int update(Date readingdate){
		return mdao.update(readingdate);
	}
	public int delete(MylistVo vo){
		return mdao.delete(vo);
	}
}
