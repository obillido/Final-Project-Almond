package project.app.almond.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.UsersVo;

@Repository
public class UsersDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.UsersMapper";
	public int updateCashSub(UsersVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".updateCashSub", vo);
	}
	public UsersVo getInfo(int usernum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo",usernum);
	}
}
