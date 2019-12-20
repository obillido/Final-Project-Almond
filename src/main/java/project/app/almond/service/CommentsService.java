package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.CommentsDao;
import project.app.almond.vo.CommentsInfoVo;
import project.app.almond.vo.CommentsVo;

@Service
public class CommentsService {
	@Autowired private CommentsDao cdao;
	public int insert(CommentsVo vo){
		return cdao.insert(vo);
	}
	public int getRef(int epinum){
		return cdao.getRef(epinum);
	}
	public int getStep(HashMap<String, Object> map){
		return cdao.getStep(map);
	}
	public List<CommentsInfoVo> getList(HashMap<String, Object> map){
		return cdao.getList(map);
	}
	public List<CommentsInfoVo> getBestList(HashMap<String, Object> map){
		return cdao.getBestList(map);
	}
	public Integer getTotalCommCnt(int contnum){
		return cdao.getTotalCommCnt(contnum);
	}
}
