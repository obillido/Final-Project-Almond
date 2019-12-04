package project.app.almond.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	@RequestMapping(value = "/a")
	public String home1() {
		return "home1";
	}
	@RequestMapping(value = "/2")
	public String home2() {
		return "home2";
	}
	@RequestMapping(value = "/3")
	public String home3() {
		return "home3";
	}
	@RequestMapping(value = "/4")
	public String home4() {
		return "home4";
	}
	@RequestMapping(value = "/5")
	public String home5() {
		return "home5";
	}
}
