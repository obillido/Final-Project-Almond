package project.app.almond.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.service.InquiryService;
import project.app.almond.vo.InquiryVo;

@Controller
public class InquiryController {
	@Autowired InquiryService service;
	
	@RequestMapping("/inquiry/inquirypage")
	public String inquirypage(int usernum,Model model){
		List<InquiryVo> list=service.list(usernum);
		model.addAttribute("list",list);
		return ".inquiry.inquirypage";
	}
	
	@RequestMapping(value="/inquiry/insert",method=RequestMethod.GET)
	public String insertForm(){
		return ".inquiry.insert";
	}
	@RequestMapping(value="/inquiry/insert",method=RequestMethod.POST)
	public String insert(String title,String content){
		try{
			InquiryVo vo=new InquiryVo(0, 1, title, content, 0, 0, 0, 0);
			service.insert(vo);
			return ".inquiry.success";
		}catch(Exception e){
            e.printStackTrace();
            return ".inquiry.fail";
		}
	}
	@RequestMapping(value="/inquiry/getInfo",method=RequestMethod.GET)
	public String getInfo(int inqnum,Model model){
		InquiryVo vo=service.getInfo(inqnum);
		model.addAttribute("vo",vo);
		return ".inquiry.getInfo";
	}
}
