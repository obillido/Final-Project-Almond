package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

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
	public List<InquiryVo> list(HashMap<String, Object> map){
		return dao.list(map);
	}
	public List<HashMap<String, Object>> listadmin(HashMap<String, Object> map){
		return dao.listadmin(map);
	}
	public InquiryVo detail(int inqnum){
		return dao.detail(inqnum);
	}
	public int count(int usernum){
		return dao.count(usernum);
	}
	public InquiryVo prev(int inqnum){
		return dao.prev(inqnum);
	}
	public InquiryVo next(int inqnum){
		return dao.next(inqnum);
	}
	public int reply(InquiryVo vo){
		return dao.reply(vo);
	}
	public int chgStatus(HashMap<String, Object> map){
		return dao.chgStatus(map);
	}
	public InquiryVo getReply(int ref){
		return dao.getReply(ref);
	}
}
