package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.MylistDao;
import project.app.almond.vo.MylistVo;
import project.app.almond.vo.WebcontentsVo;

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
	@Transactional
	public int delFromList(int mylistnum){
		mdao.reduceReadernum(mylistnum);
		mdao.delFromList(mylistnum);
		return 1;
	}
	public MylistVo isExist(MylistVo vo){
		return mdao.isExist(vo);
	}
	public int update(MylistVo vo){
		return mdao.update(vo);
	}
	public List<HashMap<String, Object>> array1(HashMap<String, Object> map){
		return mdao.array1(map);
	}
	public List<HashMap<String, Object>> array2(int usernum){
		return mdao.array2(usernum);
	}
	public List<HashMap<String, Object>> array3(int usernum){
		return mdao.array3(usernum);
	}
}
