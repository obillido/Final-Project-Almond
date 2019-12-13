package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.app.almond.service.CashService;
import project.app.almond.vo.CashVo;
import project.app.almond.vo.TicketBuyVo;

@Controller
public class CashController {
	@Autowired private CashService service;
	
	@RequestMapping(value="/cash/charge",method=RequestMethod.GET)
	public String chargeForm(HttpSession session,Model model){
		int usernum=(Integer)session.getAttribute("usernum");
		model.addAttribute("usernum",usernum);
		return ".cash.charge";
	}
	@RequestMapping(value="/cash/charge",method=RequestMethod.POST)
	public ModelAndView charge(HttpSession session,int cashamount,String paymethod){
		int usernum=(Integer)session.getAttribute("usernum");
		CashVo vo=new CashVo(0, usernum, cashamount, null, paymethod);
		int n1=service.insert(vo);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("usernum", usernum);
		map.put("price", cashamount);
		int n2=service.updateCharge(map);
		ModelAndView mv=null;
		if(n1>0 && n2>0){
			mv=new ModelAndView(".cash.success");
			mv.addObject("info",vo);	
		}
		return mv;
	}
	
	@RequestMapping(value="/cash/list",method=RequestMethod.GET)
	public String list(HttpSession session,Model model){
		int usernum=(Integer)session.getAttribute("usernum");
		int totCharge=service.totCharge(usernum);
		List<CashVo> list=service.list(usernum);
		int totCash=service.totCash(usernum);
		List<TicketBuyVo> listUse=service.listUse(usernum);		
		int totUse=service.totUse(usernum);
		
		model.addAttribute("list", list);
		model.addAttribute("listUse",listUse);
		model.addAttribute("totCharge", totCharge);
		model.addAttribute("totUse",totUse);
		model.addAttribute("totCash", totCash);
		return ".cash.list";
	}
}
