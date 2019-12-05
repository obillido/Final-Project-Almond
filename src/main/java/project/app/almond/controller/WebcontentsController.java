package project.app.almond.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.service.TicketService;
import project.app.almond.vo.TicketVo;

@Controller
public class WebcontentsController {
	@Autowired private TicketService tservice;
	@RequestMapping(value="/webcontents/choice")
	public String regiFormChoice(){
		return ".webcontents.choice";
	}
	@RequestMapping(value="/webcontents/regiForm",method=RequestMethod.GET)
	public String regiForm(int cultype,Model model){
		model.addAttribute("cultype",cultype);
		ArrayList<String> genreList=new ArrayList<String>();
		if(cultype==1){
			genreList.add("웹툰");
			genreList.add("로맨스");
			genreList.add("소년");
			genreList.add("드라마");
			genreList.add("무협");
		}else if(cultype==2){
			genreList.add("웹소설");
			genreList.add("판타지");
			genreList.add("로맨스");
			genreList.add("무협");
		}else if(cultype==3){
			genreList.add("예능");
		}else if(cultype==4){
			genreList.add("스릴러");
			genreList.add("직업");
			genreList.add("가족");
			genreList.add("로맨스");
		}else if(cultype==5){
			genreList.add("가족");
			genreList.add("스릴러");
			genreList.add("로맨스");
			genreList.add("액션");
			genreList.add("애니메이션");
		}
		model.addAttribute("genreList",genreList);
		model.addAttribute("tiketList",tservice.getInfoList(cultype));
		System.out.println("ticket잘나옴");
		return ".webcontents.regiForm";
	}
	@RequestMapping(value="/webcontents/regi",method=RequestMethod.POST)
	public String regi(){
		return "";
	}

}
