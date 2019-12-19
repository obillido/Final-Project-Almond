package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.app.almond.service.InquiryService;
import project.app.almond.vo.InquiryVo;
import project.app.almond.vo.WebcontentsVo;
import project.app.util.PageUtil;

@Controller
public class InquiryController {
	@Autowired InquiryService service;
	
	@RequestMapping("/inquiry/inquirypage")
	public ModelAndView inquirypage(HttpSession session,@RequestParam(value="pageNum",defaultValue="1")int pageNum){
		int usernum=(Integer)session.getAttribute("usernum");
		int totalRowCount=service.count(usernum);
		PageUtil pu=new PageUtil(pageNum,totalRowCount,5,5);
        int startRow=pu.getStartRow();
        int endRow=pu.getEndRow();
        ModelAndView mv=new ModelAndView(".inquiry.inquirypage");
        if(usernum==1){
			HashMap<String, Object> amap=new HashMap<String, Object>();
			amap.put("startRow",startRow);
	        amap.put("endRow",endRow);
			List<HashMap<String, Object>> alist=service.listadmin(amap);
			mv.addObject("alist",alist);
	        mv.addObject("pu",pu);
		}else{
			HashMap<String, Object> map=new HashMap<String, Object>();
	        map.put("startRow",startRow);
	        map.put("endRow",endRow);
	        map.put("usernum",usernum);
			List<InquiryVo> list=service.list(map);
			mv.addObject("list",list);
	        mv.addObject("pu",pu);
		}
		return mv;
	}
	
	@RequestMapping(value="/inquiry/insert",method=RequestMethod.GET)
	public String insertForm(){
		return ".inquiry.insert";
	}
	@RequestMapping(value="/inquiry/insert",method=RequestMethod.POST)
	public String insert(String title,String content,HttpSession session){
		int usernum=(Integer)session.getAttribute("usernum");
		Random rnd=new Random();
		int ref=0;
		for(int i=1;i<=6;i++){
			ref=rnd.nextInt(1000)+1;
		}
		try{
			InquiryVo vo=new InquiryVo(0, usernum, title, content, 0, ref, 0, 0);
			service.insert(vo);
			return "redirect:/inquiry/inquirypage";
		}catch(Exception e){
            e.printStackTrace();
            return null;
		}
	}
	@RequestMapping(value="/inquiry/detail",method=RequestMethod.GET)
	public String detail(int inqnum,Model model,int ref,HttpSession session){
		int usernum=(Integer)session.getAttribute("usernum");
		InquiryVo vo=service.detail(inqnum);
		model.addAttribute("vo",vo);
		InquiryVo vo2=service.getReply(ref);
		model.addAttribute("vo2",vo2);
		return ".inquiry.getInfo";
	}
	
	@RequestMapping(value="/inquiry/reply",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String reply(String title,String content,HttpSession session,int ref,int guestnum){
		int usernum=(Integer)session.getAttribute("usernum");
		InquiryVo vo=new InquiryVo(0, usernum, title, content, 0, ref, 1, 0);
		int n=service.reply(vo);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("ref", ref);
		map.put("usernum", guestnum);
		int n1=service.chgStatus(map);
		StringBuffer sb=new StringBuffer();
		if(n>0 && n1>0){
			sb.append("<?xml version='1.0' encoding='utf-8'?>");
			sb.append("<result>");
			sb.append("<title>" + vo.getTitle() + "</title>");
			sb.append("<content>" + vo.getContent() + "</content>");
			sb.append("</result>");
		}
		return sb.toString();	
	}	
}
