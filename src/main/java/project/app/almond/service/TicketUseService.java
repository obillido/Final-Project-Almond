package project.app.almond.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.MylistDao;
import project.app.almond.dao.ReadingDao;
import project.app.almond.dao.TicketStockDao;
import project.app.almond.dao.TicketUseDao;
import project.app.almond.dao.WebcontentsDao;
import project.app.almond.vo.MylistVo;
import project.app.almond.vo.ReadingVo;
import project.app.almond.vo.TicketStockVo;
import project.app.almond.vo.TicketUseVo;

@Service
public class TicketUseService {
	@Autowired private TicketUseDao tudao;
	@Autowired private ReadingDao rdao;
	@Autowired private MylistDao mdao;
	@Autowired private WebcontentsDao wdao;
	@Autowired private TicketStockDao tsdao;
	public List<HashMap<String, Object>> history(int usernum){
		return tudao.history(usernum);
	}
	public int insert(int usernum, int contnum, int epinum, int type, Date sysdate){
		MylistVo mvo=new MylistVo(0, contnum, usernum, 1, sysdate);
		tudao.insert(new TicketUseVo(0, usernum, epinum, sysdate, type));
		tsdao.updateSub(new TicketStockVo(0, usernum, contnum, type, 1));
		rdao.insert(new ReadingVo(0, epinum, usernum, sysdate, type));
		if(mdao.isExist(mvo)!=null) mdao.update(mvo);
		else{
			mdao.insert(mvo);
			wdao.addReadernum(mvo.getContnum());
		}
		return 1;
	}
}
