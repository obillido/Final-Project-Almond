package project.app.almond.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.WebcontentsVo;

@Controller
public class HomeController {
	@Autowired private WebcontentsService ws;
	@RequestMapping(value = "/")
	public String home(HttpSession session,Model model) {
		HashMap<String, Object> aa=new HashMap<String, Object>();
		
		List<HashMap<String, Object>> list=ws.today();
		for(HashMap<String, Object> map:list){
			aa.put("uploaddate", map.get("UPLOADDATE"));
			
			int contnum=((BigDecimal)map.get("CONTNUM")).intValue();
			WebcontentsVo wvo=ws.getInfo(contnum);	
						
			aa.put("contnum", wvo.getContnum());
			aa.put("cultype", wvo.getCultype());
			aa.put("title", wvo.getTitle());
			aa.put("img", wvo.getImg());
		}
	
		model.addAttribute("list", list);
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
	@RequestMapping(value = "/5")
	public String home5(Model model) {
		model.addAttribute("webc",ws.getInfoBook(1));
		return ".home5";
	}
}
