package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.BookDao;
import project.app.almond.dao.VideoDao;
import project.app.almond.dao.WebcontentsDao;
import project.app.almond.vo.BookVo;
import project.app.almond.vo.ScoreVo;
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
	public WebcontentsVo getInfo(int contnum){
		return wdao.getInfo(contnum);
	}
	public WebcontentsBookVo getInfoBook(int contnum){
		return wdao.getInfoBook(contnum); 
	}
	public WebcontentsVideoVo getInfoVideo(int contnum){
		return wdao.getInfoVideo(contnum); 
	}
	public List<String> getGenreList(int cultype){
		return wdao.getGenreList(cultype);
	}
	public List<WebcontentsBookVo> getListBook(HashMap<String, Object> map){
		return wdao.getListBook(map);
	}
	public List<WebcontentsVideoVo> getListVideo(HashMap<String, Object> map){
		return wdao.getListVideo(map);
	}
	public List<WebcontentsBookVo> listonday(String dayofweek){
		return wdao.listonday(dayofweek);
	}
	public List<HashMap<String, Object>> top4(int cultype){
		return wdao.top4(cultype);
	}
	public List<WebcontentsVo> jakpum(int cultype){
		return wdao.jakpum(cultype);
	}
	public List<WebcontentsVo> byReadernum(int cultype){
		return wdao.byReadernum(cultype);
	}
	public List<HashMap<String, Object>> byHit(int cultype){
		return wdao.byHit(cultype);
	}
	public List<HashMap<String, Object>> byLikes(int cultype){
		return wdao.byLikes(cultype);
	}
	public List<HashMap<String, Object>> byScore(int cultype){
		return wdao.byScore(cultype);
	}
	public List<HashMap<String, Object>> today(){
		return wdao.today();
	}
	public List<WebcontentsVo> search(String keyword){
		return wdao.search(keyword);
	}
	
	public int score(ScoreVo vo){
		return wdao.score(vo);
	}
	
	public List<WebcontentsVo> getList(int cultype){
		return wdao.getList(cultype);
	}
}
