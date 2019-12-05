package project.app.almond.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.BookDao;
import project.app.almond.dao.VideoDao;
import project.app.almond.dao.WebcontentsDao;
import project.app.almond.vo.BookVo;
import project.app.almond.vo.VideoVo;
import project.app.almond.vo.WebcontentsBookVo;
import project.app.almond.vo.WebcontentsVideoVo;
import project.app.almond.vo.WebcontentsVo;

@Service
public class WebcontentsService {
	@Autowired private WebcontentsDao wdao;
	@Autowired private VideoDao vdao;
	@Autowired private BookDao bdao;
	@Transactional
	public int insert(WebcontentsVo wvo,VideoVo vvo){
		wdao.insert(wvo);
		vvo.setContnum(wdao.getCurrContnum());
		vdao.insert(vvo);
		return 1;
	}
	@Transactional
	public int insert(WebcontentsVo wvo,BookVo bvo){
		wdao.insert(wvo);
		bvo.setContnum(wdao.getCurrContnum());
		bdao.insert(bvo);
		return 1;
	}
	public WebcontentsBookVo getInfoBook(int contnum){
		return wdao.getInfoBook(contnum); 
	}
	public WebcontentsVideoVo getInfoVideo(int contnum){
		return wdao.getInfoVideo(contnum); 
	}
}
