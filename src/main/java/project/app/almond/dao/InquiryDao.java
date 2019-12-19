package project.app.almond.dao;

import java.util.HashMap;
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
	public List<InquiryVo> list(HashMap<String,Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list",map);
	}
	public List<HashMap<String, Object>> listadmin(HashMap<String,Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE + ".listadmin",map);
	}
	public InquiryVo detail(int inqnum){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".detail",inqnum);
	}
	public int count(int usernum){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".count",usernum);
	}
    public InquiryVo prev(int inqnum){
        return sqlSessionTemplate.selectOne(NAMESPACE + ".prev",inqnum);
    }
    public InquiryVo next(int inqnum){
        return sqlSessionTemplate.selectOne(NAMESPACE + ".next",inqnum);
    }
    public int reply(InquiryVo vo){
    	return sqlSessionTemplate.insert(NAMESPACE + ".reply",vo);
    }
    public int chgStatus(HashMap<String, Object> map){
    	return sqlSessionTemplate.update(NAMESPACE + ".chgStatus",map);
    }
    public InquiryVo getReply(int ref){
    	return sqlSessionTemplate.selectOne(NAMESPACE + ".getReply",ref);
    }
}
