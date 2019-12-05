package project.app.almond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.app.almond.service.WebcontentsService;

@Controller
public class HomeController {
	@Autowired private WebcontentsService wservice;
	@RequestMapping(value = "/")
	public String home() {
		return ".layout";
	}
	@RequestMapping(value = "/2")
	public String home2() {
		return ".home2";
	}
	@RequestMapping(value = "/3")
	public String home3() {
		return ".home3";
	}
	@RequestMapping(value = "/4")
	public String home4() {
		return ".home4";
	}
	@RequestMapping(value = "/5")
	public String home5(Model model) {
		model.addAttribute("webc",wservice.getInfoBook(1));
		return ".home5";
	}
}
