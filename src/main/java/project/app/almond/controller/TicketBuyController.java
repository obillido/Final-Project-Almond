package project.app.almond.controller;

import java.util.HashMap;

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
	@Autowired private TicketService tkservice;
	@Autowired private TicketStockService tkss;
	@Autowired private WebcontentsService webtitle;
	@RequestMapping("/ticket/webtoon")
	public String cashlist(HttpSession session,int contnum,int tknum,Model model, TicketBuyVo vo){
		int usernum=(Integer)session.getAttribute("usernum");
		UsersVo uc=tbs.getinfo(usernum);
		WebcontentsVo title=webtitle.getInfo(contnum);
		//TicketBuyVo tt=service.ticketType(vo);
		model.addAttribute("uc",uc);
		model.addAttribute("title",title.getTitle());
		//model.addAttribute("tt",tt);
		model.addAttribute("contnum",contnum);
		model.addAttribute("ticket",tkservice.getInfo(tknum));
		model.addAttribute("cntOwn",tkss.getInfo(new TicketStockVo(0, usernum, contnum, 1, 0)).getCnt());
		model.addAttribute("cntRental",tkss.getInfo(new TicketStockVo(0, usernum, contnum, 2, 0)).getCnt());
		return ".ticket.webtoon";
	}
	@RequestMapping(value="/ticket/buy", method=RequestMethod.POST)
	public String ticketbuyform(TicketBuyVo vo,int tknum,Model model,HttpSession session){
		int n=tbs.insert(vo);
		
		int usernum=(Integer)session.getAttribute("usernum");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("usernum",usernum);
		map.put("price",vo.getPrice());
		tbs.updateUse(map);
		
		model.addAttribute("contnum",vo.getContnum());
		model.addAttribute("tknum",tknum);
		return "redirect:/ticket/webtoon";
	}
	

}
