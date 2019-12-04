package project.app.almond.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebcontentsController {
	@RequestMapping(value="/webcontents/choice")
	public String regiFormChoice(){
		return ".webcontents.choice";
	}
	@RequestMapping(value="/webcontents/regiForm",method=RequestMethod.GET)
	public String regiForm(int cultype,Model model){
		model.addAttribute("cultype",cultype);
		return ".webcontents.regiForm";
	}
	@RequestMapping(value="/webcontents/regi",method=RequestMethod.POST)
	public String regi(){
		return "";
	}

}
