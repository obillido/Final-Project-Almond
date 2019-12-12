package project.app.almond.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.UsersDao;
import project.app.almond.vo.UsersVo;

@Service
public class UsersService {
	@Autowired private UsersDao udao;
	public UsersVo getInfo(int usernum){
		return udao.getInfo(usernum);
	}
	public int insert(UsersVo vo) {
		return udao.insert(vo);
	}
	public UsersService(UsersDao dao) {
		this.udao = dao;
	}
	public HashMap<String,Object> login(HashMap<String,Object> map){
		return udao.login(map);
	}
	public UsersVo emailcheck(String email) {
		return udao.emailcheck(email);
	}
}
