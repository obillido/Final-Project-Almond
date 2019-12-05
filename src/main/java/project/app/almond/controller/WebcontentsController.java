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
			genreList.add("����");
			genreList.add("�θǽ�");
			genreList.add("�ҳ�");
			genreList.add("���");
			genreList.add("����");
		}else if(cultype==2){
			genreList.add("���Ҽ�");
			genreList.add("��Ÿ��");
			genreList.add("�θǽ�");
			genreList.add("����");
		}else if(cultype==3){
			genreList.add("����");
		}else if(cultype==4){
			genreList.add("������");
			genreList.add("����");
			genreList.add("����");
			genreList.add("�θǽ�");
		}else if(cultype==5){
			genreList.add("����");
			genreList.add("������");
			genreList.add("�θǽ�");
			genreList.add("�׼�");
			genreList.add("�ִϸ��̼�");
		}
		model.addAttribute("genreList",genreList);
		model.addAttribute("tiketList",tservice.getInfoList(cultype));
		System.out.println("ticket�߳���");
		return ".webcontents.regiForm";
	}
	@RequestMapping(value="/webcontents/regi",method=RequestMethod.POST)
	public String regi(){
		return "";
	}

}
