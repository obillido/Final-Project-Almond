package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.app.almond.service.InquiryService;
import project.app.almond.vo.InquiryVo;
import project.app.util.PageUtil;

@Controller
public class InquiryController {
	@Autowired InquiryService service;
	
	@RequestMapping("/inquiry/inquirypage")
	public ModelAndView inquirypage(int usernum,@RequestParam(value="pageNum",defaultValue="1")int pageNum){
		int totalRowCount=service.count(usernum);
		PageUtil pu=new PageUtil(pageNum,totalRowCount,5,5);
        int startRow=pu.getStartRow();
        int endRow=pu.getEndRow();
		HashMap<String, Object> map=new HashMap<String, Object>();
        map.put("startRow",startRow);
        map.put("endRow",endRow);
        map.put("usernum",usernum);
		List<InquiryVo> list=service.list(map);
		ModelAndView mv=new ModelAndView(".inquiry.inquirypage");
        mv.addObject("list",list);
        mv.addObject("pu",pu);
		return mv;
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
	@RequestMapping(value="/inquiry/detail",method=RequestMethod.GET)
	public String detail(int inqnum,Model model){
		InquiryVo vo=service.detail(inqnum);
		model.addAttribute("vo",vo);
		return ".inquiry.getInfo";
	}
}
