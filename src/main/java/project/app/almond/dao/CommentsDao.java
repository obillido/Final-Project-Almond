package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.CommentsInfoVo;
import project.app.almond.vo.CommentsVo;

@Repository
public class CommentsDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.CommentsMapper";
	
	public int insert(CommentsVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int getRef(int epinum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getRef",epinum);
	}
	public int getStep(HashMap<String, Object> map){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getStep",map);
	}
	public List<CommentsInfoVo> getList(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".getList",map);
	}
	public List<CommentsInfoVo> getBestList(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".getBestList",map);
	}
	public Integer getCnt(int epinum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getCnt",epinum);
	}
	public Integer getTotalCnt(int contnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getTotalCnt",contnum);
	}
	public CommentsVo getInfo(int commnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo",commnum);
	}
}
