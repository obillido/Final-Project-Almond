package project.app.almond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.app.almond.service.TicketBuyService;
import project.app.almond.service.TicketService;
import project.app.almond.vo.TicketBuyVo;
import project.app.almond.vo.UsersVo;

@Controller
public class TicketBuyController {
	@Autowired
	private TicketBuyService service;
	@Autowired TicketService tkservice;
	@RequestMapping("/ticket/webtoon")
	public String cashlist(int usernum,int contnum,int tknum,Model model){
		UsersVo vo=service.getinfo(usernum);
		model.addAttribute("vo",vo);
		model.addAttribute("usernum",1);
		model.addAttribute("contnum",contnum);
		model.addAttribute("ticket",tkservice.getInfo(tknum));
		return ".ticket.webtoon";
	}
	
	@RequestMapping("/ticket/buy")
	public String ticketbuyform(TicketBuyVo vo){
		System.out.println("????");
		int n=service.insert(vo);
		return ".ticket.webtoon";
	}
	
	/*
	@RequestMapping(value="/ticket/webtoon",method=RequestMethod.POST)
	public String ticketBuyinsert(TicketbuyVo vo){
		try{
			service.insert(vo);
			return "redirect:/5";
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:/5";
		}
	}
	*/
}
