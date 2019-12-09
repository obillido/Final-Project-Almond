package project.app.almond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	public String charge(int usernum,int cashamount,String paymethod){
		CashVo vo=new CashVo(0, usernum, cashamount, null, paymethod);
		service.insert(vo);
	}
}
