package project.app.almond.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebtoonController {
	@RequestMapping("/webtoon/webtoonpage")
	public String main(){
		return ".webtoonpage";
	}
}
