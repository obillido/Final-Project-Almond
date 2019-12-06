package project.app.almond.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentsController {
	@RequestMapping(value="/webcontents/comments")
	public String commentsList(Model model){
		return ".webcontents.comments";
	}
}
