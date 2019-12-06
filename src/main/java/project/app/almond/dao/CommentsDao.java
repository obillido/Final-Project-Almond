package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.CommentsVo;

@Repository
public class CommentsDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.CommentsMapper";
	public int insert(CommentsVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public List<CommentsVo> getList(int epinum){
		return sqlSessionTemplate.selectList(NAMESPACE+".getList",epinum);
	}
}
