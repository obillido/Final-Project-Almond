package project.app.almond.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.service.NoticeService;
import project.app.almond.vo.NoticeVo;

@Controller
public class NoticeController {
	@Autowired private NoticeService ns;
	@RequestMapping(value="/notice/list",method=RequestMethod.GET)
	public String list(int contnum,Model model){
		List<NoticeVo> list=ns.list(contnum);
		model.addAttribute("list", list);
		model.addAttribute("contnum", contnum);
		return ".notice.list";
	}
	@RequestMapping(value="/notice/insert",method=RequestMethod.GET)
	public String insertForm(int contnum,Model model){
		model.addAttribute("contnum", contnum);
		return ".notice.insert";
	}
	@RequestMapping(value="/notice/insert",method=RequestMethod.POST)
	public String insert(int contnum,String title,String content,Model model){
		NoticeVo vo=new NoticeVo(0, contnum, title, content, null);
		int n=ns.insert(vo);
		System.out.println("vo출력결과:" + vo);
		System.out.println("n출력결과:" + n);
		if(n>0){
			List<NoticeVo> list=ns.list(contnum);
			model.addAttribute("list", list);
			return ".notice.list";
		}else{
			return ".notice.fail";
		}
	}
}
