package project.app.almond.dao;

import java.util.HashMap;

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
	public int insert(UsersVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public UsersVo login(UsersVo vo) {
		return sqlSessionTemplate.selectOne("project.mybatis.mapper.UsersMapper.login",vo);
	}
	public UsersVo emailcheck(String email) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".emailcheck",email);
	}
	public int chgProfile(UsersVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".chgProfile",vo);
	}
}
