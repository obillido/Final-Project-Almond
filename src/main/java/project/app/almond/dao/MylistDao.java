package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.MylistVo;

@Repository
public class MylistDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.MylistMapper";
	public int insert(MylistVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int update(HashMap<String, Object> map){
		return sqlSessionTemplate.update(NAMESPACE+".update",map);
	}
	public int delete(MylistVo vo){
		return sqlSessionTemplate.delete(NAMESPACE+".delete",vo);
	}
	public MylistVo isExist(HashMap<String, Object> map){
		return sqlSessionTemplate.selectOne(NAMESPACE+".isExist",map);
	}
	public List<MylistVo> list(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list",usernum);
	}
	public int delFromList(int mylistnum){
		return sqlSessionTemplate.delete(NAMESPACE + ".delFromList",mylistnum);
	}
}
