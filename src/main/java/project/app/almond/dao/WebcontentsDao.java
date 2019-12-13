package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.WebcontentsBookVo;
import project.app.almond.vo.WebcontentsVideoVo;
import project.app.almond.vo.WebcontentsVo;

@Repository
public class WebcontentsDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.WebcontentsMapper";
	public int insert(WebcontentsVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int getCurrContnum(){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getCurrContnum");
	}
	public WebcontentsVo getInfo(int contnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo",contnum);
	}
	public WebcontentsBookVo getInfoBook(int contnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfoBook",contnum);
	}
	public WebcontentsVideoVo getInfoVideo(int contnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfoVideo",contnum);
	}
	public List<String> getGenreList(int cultype){
		return sqlSessionTemplate.selectList(NAMESPACE+".getGenreList",cultype);
	}
	public List<WebcontentsBookVo> getListBook(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".getListBook",map);
	}
	public List<WebcontentsVideoVo> getListVideo(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".getListVideo",map);
	}
	
	public int addReadernum(int contnum){
		return sqlSessionTemplate.update(NAMESPACE+".addReadernum",contnum);
	}
	
	
	
	public List<WebcontentsBookVo> listonday(String dayofweek){
		return sqlSessionTemplate.selectList(NAMESPACE + ".listonday",dayofweek);
	}
	public List<HashMap<String, Object>> top4(int cultype){
		return sqlSessionTemplate.selectList(NAMESPACE + ".top4",cultype);
	}
	public List<WebcontentsVo> jakpum(int cultype){
		return sqlSessionTemplate.selectList(NAMESPACE + ".jakpum",cultype);
	}
}
