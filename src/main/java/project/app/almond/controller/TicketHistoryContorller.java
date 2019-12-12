package project.app.almond.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.app.almond.service.TicketBuyService;
import project.app.almond.service.TicketUseService;

@Controller
public class TicketHistoryContorller {
	@Autowired private TicketBuyService tbs;
	@Autowired private TicketUseService tus;
	@RequestMapping("/ticket/history")
	public String tickethistory(HttpSession session,Model model){
		int usernum=(Integer)session.getAttribute("usernum");
		model.addAttribute("tbh",tbs.history(usernum));
		model.addAttribute("tuh",tus.history(usernum));
		return "ticket/history";
	}
}
