package project.app.almond.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.AlarmDao;
import project.app.almond.dao.MylistDao;
import project.app.almond.dao.ReadingDao;
import project.app.almond.dao.WebcontentsDao;
import project.app.almond.vo.AlarmVo;
import project.app.almond.vo.MylistVo;
import project.app.almond.vo.ReadingVo;
import project.app.almond.vo.WebcontentsVo;

@Service
public class ReadingService {
	@Autowired private ReadingDao rdao;
	@Autowired private MylistDao mdao;
	@Autowired private WebcontentsDao wdao;
	@Autowired private AlarmDao adao;
	
	@Transactional
	public int insert(int usernum, int contnum, int epinum, int type, Date sysdate){
		MylistVo mvo=new MylistVo(0, contnum, usernum, 1, sysdate);
		rdao.insert(new ReadingVo(0, epinum, usernum, sysdate, type));
		if(mdao.isExist(mvo)!=null) mdao.update(mvo);
		else{
			mdao.insert(mvo);
			wdao.addReadernum(mvo.getContnum());
		}
		if(type==6){
			WebcontentsVo wvo=wdao.getInfo(contnum);
			Calendar cal=Calendar.getInstance();
			cal.setTime(new java.util.Date());
			cal.add(Calendar.HOUR, wvo.getWaiting());
			String showdate=new SimpleDateFormat("yyyyMMddHHmmss").format(cal.getTime());
			adao.insert(new AlarmVo(0, usernum, "[기다리면 무료] "+wvo.getTitle(), "지금 바로 한 편을 무료로 감상하세요.", null, showdate, 11, contnum, 0));
		}
		return 1;
	}
	public Integer getRemainingWaitingTime(HashMap<String, Object> map){
		return rdao.getRemainingWaitingTime(map);
	}
}
