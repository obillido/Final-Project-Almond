package project.app.almond.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebcontentsController {
	@RequestMapping(value="/webcontents/videoRegi",method=RequestMethod.GET)
	public String regiVedioForm(){
		return ".webcontents.videoRegi";
	}
}
