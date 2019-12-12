package project.app.almond.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.TicketUseDao;

@Service
public class TicketUseService {
	@Autowired private TicketUseDao tudao;
	public List<HashMap<String, Object>> history(int usernum){
		return tudao.history(usernum);
	}
}
