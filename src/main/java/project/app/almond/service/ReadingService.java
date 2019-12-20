package project.app.almond.service;

import java.sql.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.MylistDao;
import project.app.almond.dao.ReadingDao;
import project.app.almond.dao.WebcontentsDao;
import project.app.almond.vo.MylistVo;
import project.app.almond.vo.ReadingVo;

@Service
public class ReadingService {
	@Autowired private ReadingDao rdao;
	@Autowired private MylistDao mdao;
	@Autowired private WebcontentsDao wdao;
	@Transactional
	public int insert(int usernum, int contnum, int epinum, int type, Date sysdate){
		MylistVo mvo=new MylistVo(0, contnum, usernum, 1, sysdate);
		rdao.insert(new ReadingVo(0, epinum, usernum, sysdate, type));
		if(mdao.isExist(mvo)!=null) mdao.update(mvo);
		else{
			mdao.insert(mvo);
			wdao.addReadernum(mvo.getContnum());
		}
		return 1;
	}
	public Integer getRemainingWaitingTime(HashMap<String, Object> map){
		return rdao.getRemainingWaitingTime(map);
	}
	
	
	
}
