package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.MylistDao;
import project.app.almond.dao.ReadingDao;
import project.app.almond.vo.MylistVo;
import project.app.almond.vo.ReadingVo;

@Service
public class ReadingService {
	@Autowired private ReadingDao rdao;
	@Autowired private MylistDao mdao;
	@Transactional
	public int insert(ReadingVo rvo,MylistVo mvo){
		if(rdao.isExist(rvo)==null){
			rdao.insert(rvo);
			if(mdao.isExist(mvo)!=null) mdao.update(mvo);
			else						mdao.insert(mvo);
		}else{
			if(rvo.getType()==1) rdao.update(rvo);
			if(mdao.isExist(mvo)!=null) mdao.update(mvo);
			else						mdao.insert(mvo);
		}
		return 1;
	}
	public ReadingVo isExist(ReadingVo rvo){
		return rdao.isExist(rvo);
	}
}
