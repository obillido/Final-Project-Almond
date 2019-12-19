package project.app.almond.service;

import java.math.BigDecimal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.AlarmDao;
import project.app.almond.dao.CommLikesDao;
import project.app.almond.dao.CommentsDao;
import project.app.almond.dao.UsersDao;
import project.app.almond.vo.AlarmVo;
import project.app.almond.vo.CommLikesVo;
import project.app.almond.vo.CommentsVo;
import project.app.almond.vo.UsersVo;

@Service
public class CommLikesService {
	@Autowired private CommLikesDao cldao;
	@Autowired private AlarmDao adao;
	@Autowired private UsersDao udao;
	
	public int insert(CommLikesVo vo){
		cldao.insert(vo);
		insertAlarm(vo);
		return 1;
	}
	public int update(CommLikesVo vo){
		cldao.update(vo);
		insertAlarm(vo);
		return 1;
	}
	public CommLikesVo isExist(CommLikesVo vo){
		return cldao.isExist(vo);
	}
	public int getCnt(CommLikesVo vo){
		return cldao.getCnt(vo);
	}
	
	void insertAlarm(CommLikesVo vo){
		HashMap<String, Object> map=cldao.getInfo(vo.getCommnum());
		UsersVo uvo1=udao.getInfo(((BigDecimal)map.get("U1")).intValue());
		UsersVo uvo2=udao.getInfo(((BigDecimal)map.get("U2")).intValue());
		String title="[¥Ò±€] "+map.get("TITLE")+" "+map.get("EPNUM")+"»≠";
		String content;
		int type=((BigDecimal)map.get("TYPE")).intValue();
		if(type==1) content="["+uvo1.getNickname()+"]¥‘¿Ã '¡¡æ∆ø‰'∏¶ «œºÃΩ¿¥œ¥Ÿ.";
		else if(type==2) content="["+uvo1.getNickname()+"]¥‘¿Ã 'Ω»æÓø‰'∏¶ «œºÃΩ¿¥œ¥Ÿ.";
		else if(type==-1) content="["+uvo1.getNickname()+"]¥‘¿Ã '¡¡æ∆ø‰'∏¶ √Îº“«œºÃΩ¿¥œ¥Ÿ.";
		else if(type==-2) content="["+uvo1.getNickname()+"]¥‘¿Ã 'Ω»æÓø‰'∏¶ √Îº“«œºÃΩ¿¥œ¥Ÿ.";
		else content="["+uvo1.getNickname()+"]¥‘¿Ã ¥Ò±€¿ª ¥ŸºÃΩ¿¥œ¥Ÿ.";
		adao.insert(new AlarmVo(0, uvo2.getUsernum(), title, content, null, vo.getType(), vo.getCommnum(), 0));
	}
}
