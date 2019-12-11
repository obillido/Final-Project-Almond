package project.app.almond.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.service.TicketBuyService;
import project.app.almond.service.TicketService;
import project.app.almond.service.TicketStockService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.TicketBuyVo;
import project.app.almond.vo.TicketStockVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WebcontentsVo;

@Controller
public class TicketBuyController {
	@Autowired private TicketBuyService tbs;
	@Autowired private TicketService ts;
	@Autowired private TicketStockService tss;
	@Autowired private WebcontentsService webtitle;
	@RequestMapping("/ticket/webtoon")
	public String cashlist(HttpSession session,int contnum,Model model, TicketBuyVo vo){
		int usernum=(Integer)session.getAttribute("usernum");
		UsersVo uc=tbs.getinfo(usernum);
		WebcontentsVo title=webtitle.getInfo(contnum);
		//TicketBuyVo tt=service.ticketType(vo);
		model.addAttribute("uc",uc);
		model.addAttribute("title",title.getTitle());
		//model.addAttribute("tt",tt);
		model.addAttribute("contnum",contnum);
		model.addAttribute("ticket",ts.getInfo(title.getTknum()));
		TicketStockVo tsvo1=tss.getInfo(new TicketStockVo(0, usernum, contnum, 1, 0));
		TicketStockVo tsvo2=tss.getInfo(new TicketStockVo(0, usernum, contnum, 2, 0));
		int cntOwn=0, cntRental=0;
		if(tsvo1!=null) cntOwn=tsvo1.getCnt();
		if(tsvo2!=null) cntRental=tsvo2.getCnt();
		model.addAttribute("cntOwn",cntOwn);
		model.addAttribute("cntRental",cntRental);
		return ".ticket.webtoon";
	}
	@RequestMapping(value="/ticket/buy", method=RequestMethod.POST)
	public String ticketbuyform(TicketBuyVo vo,Model model){
		int n=tbs.insert(vo);
		model.addAttribute("contnum",vo.getContnum());
		return "redirect:/webcontents/episode/list";
	}
	

}
