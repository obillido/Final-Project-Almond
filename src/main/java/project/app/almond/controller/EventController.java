package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.app.almond.service.EventService;
import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.Event2Vo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;

@Controller
public class EventController {
	@Autowired private EventService service;
	@RequestMapping("/event1")
	public String event1(){
		return ".event.1";
	}
	@RequestMapping(value="/event2", method=RequestMethod.GET )
	public String event2(){
		return ".event.2";
	}
	@RequestMapping("/event3")
	public String event3(){
		return ".event.3";
	}
	@RequestMapping("/event4")
	public String event4(){
		return ".event.4";
	}
	@RequestMapping("/event5")
	public String event5(){
		return ".event.5";
	}
	@RequestMapping(value="/answer", method=RequestMethod.POST)
	public String answer(Model model,UsersVo vo,String answer){	
		try{
			System.out.println(answer+"   "+answer.equals("아몬드"));
			if(answer.equals("아몬드")){
				service.updateCash(vo);
				model.addAttribute("code","success");
			}else{
				model.addAttribute("code","fail");
			}
		}catch(Exception e){		
			e.printStackTrace();
		}		
			return ".event.answer";
	}
	//event2 추첨사람 뽑아오기(당첨자확인페이지로 보내던가 알림으로..?여튼 ㅠ)
	@RequestMapping(value="/event2list")
	public String event2select(Model model){
		List<Event2Vo> list=service.event2();
		model.addAttribute("list",list);
		return ".event.event2list";
	}
	//event3 추첨사람 뽑아오기(댓글)
	@RequestMapping(value="/event3list")
	public String event3select(Model model){
		List<CommentsEpisodeVo> list=service.event3();
		model.addAttribute("list",list);
		return ".event.event3list";
	}
	//event3 추첨사람 뽑아오기(읽은사람)
	@RequestMapping(value="/event3reading")
	public String event3reading(Model model){
		List<ReadingEpisodeVo> list=service.event3reading();
		model.addAttribute("list",list);
		return ".event.event3reading";
	}
	//event5 룰렛 당첨금액 받아오기....
	@RequestMapping(value="/rullCash", method=RequestMethod.POST)
	@ResponseBody
	public String rullcash(UsersVo vo,HttpServletRequest req,int cash){	
		try{
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>");
			sb.append("<result>");
			if(cash>0){
				service.updateCash(vo);
				sb.append("<code>success</code>");
			}else{
				sb.append("<code>fail</code>");
			}
			sb.append("</result>");		
		}catch(Exception e){		
			e.printStackTrace();
		}		
		return ".event.5";	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/test")
	public String test(){
		return ".event.test";
	}
}























