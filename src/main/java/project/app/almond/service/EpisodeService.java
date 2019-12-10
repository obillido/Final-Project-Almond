package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.app.almond.dao.EpisodeDao;
import project.app.almond.vo.EpisodeVo;
import project.app.almond.vo.WebcontentsVo;

@Service
public class EpisodeService {
	@Autowired private EpisodeDao edao;
	public int insert(EpisodeVo vo){
		return edao.insert(vo);
	}
	public int getEpnum(int contnum){
		return edao.getEpnum(contnum);
	}
	public List<EpisodeVo> getList(HashMap<String, Object> map){
		return edao.getList(map);
	}
	@Transactional
	public EpisodeVo getInfo(int epinum){
		edao.addHit(epinum);
		return edao.getInfo(epinum);
	}
}
