package project.app.almond.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.VideoVo;

@Repository
public class VideoDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.VideoMapper";
	public int insert(VideoVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
}
