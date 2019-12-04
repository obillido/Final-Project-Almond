package project.app.almond.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	@RequestMapping("/event1")
	public String event1(){
		return ".event.1";
	}
	@RequestMapping("/event2")
	public String event2(){
		return ".event.2";
	}
	@RequestMapping("/event3")
	public String event3(){
		return ".event.3";
	}
}
