package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.NoticeVo;

@Repository
public class NoticeDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.NoticeMapper";
	public int insert(NoticeVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".insert",vo);
	}
	public List<NoticeVo> list(int contnum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list",contnum);
	}
}
