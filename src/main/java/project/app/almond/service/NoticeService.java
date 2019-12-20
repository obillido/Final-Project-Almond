package project.app.almond.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.NoticeDao;
import project.app.almond.vo.NoticeVo;

@Service
public class NoticeService {
	@Autowired private NoticeDao ndao;
	public int insert(NoticeVo vo){
		return ndao.insert(vo);
	}
	public List<NoticeVo> list(int contnum){
		return ndao.list(contnum);
	}
}
