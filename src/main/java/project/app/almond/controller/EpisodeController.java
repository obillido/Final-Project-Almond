package project.app.almond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.service.EpisodeService;

@Controller
public class EpisodeController {
	@Autowired private EpisodeService es;
	@RequestMapping(value="/webcontents/episode/regi",method=RequestMethod.GET)
	public String insertForm(int cultype,int contnum,Model model){
		model.addAttribute("maxEpnum",es.getEpnum(contnum));
		return ".webcontents.episode.regiForm";
	}
	
	public String insert(int contnum,String img,Model model){
		return ".webcontents.contentsInfo";
	}
}
