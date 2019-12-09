package project.app.almond.service;

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
}
