package project.app.almond.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.EventHistoryVo;

@Repository
public class EventHistoryDao {
	@Autowired private SqlSessionTemplate session;
	private final String NAMESPACE="project.mybatis.mapper.EventHistoryMapper";
	
	public int eventhistory(EventHistoryVo vo){//�귿���� ����� ���̺� �ֱ�
		return session.insert(NAMESPACE+".eventhistory",vo);
	}

	public EventHistoryVo roulList(HashMap<String, Object> map){//�귿���� ����Ʈ
		return session.selectOne(NAMESPACE+".roulList",map);
	}
}
