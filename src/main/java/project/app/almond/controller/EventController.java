package project.app.almond.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.service.EventService;
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
			System.out.println(answer+"   "+answer.equals("�Ƹ��"));
			if(answer.equals("�Ƹ��")){
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
	/*
	@RequestMapping("/how")
	public String how(){
		return ".event.how";
	}
	@RequestMapping("/test")
	public String test(){
		return ".event.test";
	}*/
}























