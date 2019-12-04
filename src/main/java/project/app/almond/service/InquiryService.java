package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.InquiryDao;
import project.app.almond.vo.InquiryVo;

@Service
public class InquiryService {
	@Autowired private InquiryDao dao;
	
	public int insert(InquiryVo vo){
		return dao.insert(vo);
	}
}
