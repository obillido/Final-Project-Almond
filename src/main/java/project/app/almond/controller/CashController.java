package project.app.almond.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.app.almond.service.CashService;
import project.app.almond.vo.CashVo;

@Controller
public class CashController {
	@Autowired private CashService service;
	
	@RequestMapping(value="/cash/charge",method=RequestMethod.GET)
	public String chargeForm(int usernum,Model model){
		model.addAttribute("usernum",usernum);
		return ".cash.charge";
	}
	@RequestMapping(value="/cash/charge",method=RequestMethod.POST)
	public ModelAndView charge(int usernum,int cashamount,String paymethod){
		CashVo vo=new CashVo(0, usernum, cashamount, null, paymethod);
		int n=service.insert(vo);
		ModelAndView mv=null;
		if(n>0){
			mv=new ModelAndView(".cash.success");
			mv.addObject("info",vo);	
		}
		return mv;
	}
	
	@RequestMapping(value="/cash/list",method=RequestMethod.GET)
	public String list(int usernum,Model model){
		int totcash=service.totcash(usernum);
		List<CashVo> list=service.list(usernum);
		model.addAttribute("list", list);
		model.addAttribute("totcash", totcash);
		return ".cash.list";
	}
}
