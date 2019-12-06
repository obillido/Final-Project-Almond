package project.app.almond.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.EpisodeDao;
import project.app.almond.vo.EpisodeVo;

@Service
public class EpisodeService {
	@Autowired private EpisodeDao edao;
	public int insert(EpisodeVo vo){
		return edao.insert(vo);
	}
	public int getEpnum(int contnum){
		return edao.getEpnum(contnum);
	}
	public List<EpisodeVo> getList(int contnum){
		return edao.getList(contnum);
	}
}
