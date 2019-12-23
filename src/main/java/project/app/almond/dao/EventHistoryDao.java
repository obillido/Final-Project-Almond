package project.app.almond.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.EventHistoryVo;

@Repository
public class EventHistoryDao {
	@Autowired private SqlSessionTemplate session;
	private final String NAMESPACE="project.mybatis.mapper.EventHistoryMapper";
	
	public int eventhistory(EventHistoryVo vo){//·ê·¿µ¹¸° »ç¶÷µé Å×ÀÌºí¿¡ ³Ö±â
		return session.insert(NAMESPACE+".eventhistory",vo);
	}

	public List<EventHistoryVo> roulList(int usernum){//·ê·¿µ¹¸° ¸®½ºÆ®
		return session.selectList(NAMESPACE+".roulList",usernum);
	}
}
