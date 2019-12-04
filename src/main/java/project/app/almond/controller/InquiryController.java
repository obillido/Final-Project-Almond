package project.app.almond.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.vo.InquiryVo;

@Controller
public class InquiryController {
	@RequestMapping("/inquiry/inquirypage")
	public String inquirypage(){
		return ".inquiry.inquirypage";
	}
	
	@RequestMapping(value="/inquiry/insert",method=RequestMethod.GET)
	public String insertForm(){
		return ".inquiry.insert";
	}
	@RequestMapping(value="/inquiry/insert",method=RequestMethod.POST)
	public String insert(InquiryVo vo){
		return null;
	}
}
