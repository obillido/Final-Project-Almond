package project.app.almond.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.TicketDao;
import project.app.almond.vo.TicketVo;

@Service
public class TicketService {
	@Autowired private TicketDao tdao;
	public List<TicketVo> getInfoList(int cultype){
		return tdao.getInfoList(cultype);
	}
}
