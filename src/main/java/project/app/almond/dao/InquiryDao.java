package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.InquiryVo;

@Repository
public class InquiryDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.InquiryMapper";
	
	public int insert(InquiryVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".insert",vo);
	}
	public List<InquiryVo> list(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list",usernum);
	}
	public InquiryVo getInfo(int inqnum){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".getInfo",inqnum);
	}
}
