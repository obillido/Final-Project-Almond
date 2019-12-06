package project.app.almond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.app.almond.service.EpisodeService;
import project.app.almond.service.WebcontentsService;

@Controller
public class TemplContentsController {
	@Autowired private WebcontentsService ws;
	@Autowired private EpisodeService es;
	@RequestMapping("/webcontents/contents")
	public String contentsInfo(int contnum,int cultype,Model model){
		System.out.println("?????");
		if(cultype==1 || cultype==2) model.addAttribute("contInfo",ws.getInfoBook(contnum));
		else model.addAttribute("contInfo",ws.getInfoVideo(contnum));
		System.out.println("?????");
		model.addAttribute("epiList",es.getList(contnum));
		System.out.println("?????");
		return ".webcontents.contentsInfo";
	}
}
