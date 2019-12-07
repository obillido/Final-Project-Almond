package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.CommentsDao;
import project.app.almond.vo.CommentsVo;

@Service
public class CommentsService {
	@Autowired private CommentsDao cdao;
	public int insert(CommentsVo vo){
		return cdao.insert(vo);
	}
	public List<CommentsVo> getList(int epinum){
		return cdao.getList(epinum);
	}
	public int getRef(int epinum){
		return cdao.getRef(epinum);
	}
	public int getStep(HashMap<String, Object> map){
		return cdao.getStep(map);
	}
}
