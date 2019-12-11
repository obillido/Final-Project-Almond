package project.app.almond.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.app.almond.service.TicketBuyService;
import project.app.almond.vo.TicketBuyVo;

@Controller
public class TicketHistoryContorller {
	@Autowired private TicketBuyService tbs;
	@RequestMapping("/ticket/history")
	public String ticketInvoice(int usernum, Model model){
		List<TicketBuyVo> his=tbs.history(usernum);
		model.addAttribute("list",his);
		return ".ticket.history";
	}
}
