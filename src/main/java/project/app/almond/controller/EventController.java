package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import project.app.almond.service.WinnerService;
import project.app.almond.vo.CommentsEpisodeVo;
import project.app.almond.vo.Event2Vo;
import project.app.almond.vo.ReadingEpisodeVo;
import project.app.almond.vo.UsersVo;
import project.app.almond.vo.WinnerVo;

@Controller
public class EventController {
	@Autowired private EventService service;
	@Autowired private WinnerService ws;
	
	@RequestMapping("/event1")
	public String event1(){
		return ".event.1";
	}
	@RequestMapping(value="/event2", method=RequestMethod.GET )
	public String event2(int eventnum,Model model){
		model.addAttribute("eventnum",eventnum);
		List<UsersVo> list=ws.select(eventnum);
		if(list!=null) model.addAttribute("list",list);
		return ".event.2";
	}
	//event2 추첨사람 뽑아오기(당첨자확인페이지로 보내던가 알림으로..?여튼 ㅠ)
	@RequestMapping(value="/event2", method=RequestMethod.POST)
	public String event2select(int eventnum,Model model){
		int n=0;
		if(ws.check(eventnum)==0){//당첨버튼 누르기 전이면 실행
			n=service.event2(eventnum);	
			if(n<1) model.addAttribute("msg","실패");
		}else{//당첨버튼 눌러서 당첨자 나오면 당첨자 리스트에 담기
			List<UsersVo> list=ws.select(eventnum);
			model.addAttribute("list",list);
			model.addAttribute("msg","이미 실행된 이벤트입니다.");
		}
		model.addAttribute("eventnum",eventnum);
		
		return ".event.2";
	}
	//home2에서 이벤트4를 눌렀을때
	@RequestMapping(value="/event4", method=RequestMethod.GET)
	public String event4(int eventnum,Model model){		
		model.addAttribute("eventnum",eventnum);
		List<UsersVo> list=ws.select(eventnum);
		if(list!=null) model.addAttribute("list",list);//이벤트참여했던 사람들 담기
		return ".event.4";
	}
	//아몬드 입력하고 확인버튼 눌렀을때
	@RequestMapping(value="/event4",method=RequestMethod.POST)
	public String event4post(int eventnum, Model model, HttpSession session,String answer,UsersVo vo){						
			if(ws.check(eventnum)==0){//이벤트참여한적 없으면
				if(answer.equals("아몬드")){
					int a=service.event4(vo,eventnum,session); //아몬드 입력한 사람들 캐시업데이트,위너테이블 인서트
					if(a>0){
						model.addAttribute("msg","성공");
					}else{ 
						model.addAttribute("msg","실패");		
					}
				}else{
					model.addAttribute("msg","정답이아닙니다.");
				}
			}else{
				List<UsersVo> list=ws.select(eventnum);//참여한 사람들 리스트에 담기
				model.addAttribute("list",list);
				model.addAttribute("msg","이미 실행된 이벤트입니다.");
			}
			model.addAttribute("eventnum",eventnum);
			return ".event.4";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/event3")
	public String event3(){
		return ".event.3";
	}
	
	@RequestMapping("/event5")
	public String event5(){
		return ".event.5";
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
				//service.updateCash(vo);
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























