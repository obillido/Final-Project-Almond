package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.MylistDao;
import project.app.almond.vo.MylistVo;

@Service
public class MylistService {
	@Autowired private MylistDao mdao;
	public int delete(MylistVo vo){
		return mdao.delete(vo);
	}
	public int insert(MylistVo vo){
		return mdao.insert(vo);
	}
	public List<MylistVo> list(int usernum){
		return mdao.list(usernum);
	}
	public int delFromList(int mylistnum){
		return mdao.delFromList(mylistnum);
	}
	public MylistVo isExist(HashMap<String, Object> map){
		return mdao.isExist(map);
	}
	public int update(HashMap<String, Object> map){
		return mdao.update(map);
	}
}
