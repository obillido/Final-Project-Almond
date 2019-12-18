package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.MylistVo;
import project.app.almond.vo.WebcontentsVo;

@Repository
public class MylistDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.MylistMapper";
	public int insert(MylistVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public int update(MylistVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".update",vo);
	}
	public int delete(MylistVo vo){
		return sqlSessionTemplate.delete(NAMESPACE+".delete",vo);
	}
	public MylistVo isExist(MylistVo vo){
		return sqlSessionTemplate.selectOne(NAMESPACE+".isExist",vo);
	}
	public List<MylistVo> list(int usernum){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list",usernum);
	}
	public int delFromList(int mylistnum){
		return sqlSessionTemplate.delete(NAMESPACE + ".delFromList",mylistnum);
	}
	public int reduceReadernum(int mylistnum){
		return sqlSessionTemplate.update(NAMESPACE + ".reduceReadernum",mylistnum);
	}
	public List<WebcontentsVo> array1(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE + ".array1",map);
	}
}
