package project.app.almond.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.service.GiftService;
import project.app.almond.service.TicketService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.GiftHistoryVo;
import project.app.almond.vo.GiftVo;
import project.app.almond.vo.WebcontentsVo;

@Controller
public class GiftController {
	@Autowired private TicketService ts;
	@Autowired private GiftService gs;
	@Autowired private WebcontentsService ws;
	
	@RequestMapping(value="/gift/gift")
	public String giftlist(){
		return ".gift.gift";
	}
	
	@RequestMapping(value="/gift/giftList",method=RequestMethod.GET)
	public String regiForm(int cultype,Model model, WebcontentsVo vo){
		List<WebcontentsVo> gvo=ws.getList(cultype);
		model.addAttribute("gvo", gvo);
		model.addAttribute("cultype",cultype);
		ArrayList<String> genreList=new ArrayList<String>();
		if(cultype==1){
			genreList.add("�θǽ�");
			genreList.add("�ҳ�");
			genreList.add("���");
			genreList.add("����");
		}else if(cultype==2){
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
		model.addAttribute("ticketList",ts.getInfoList(cultype));
		return ".gift.giftlist1";
	}
	
	@RequestMapping(value="/gift/regi",method=RequestMethod.POST)
	public String regi(GiftVo vo, Model model){
		int n=gs.giftinsert(vo);
			return "redirect:/gift/gift";
	}
	
	@RequestMapping(value="/gift/giftbox")
	public String giftbox(HttpSession session, Model model){
		int usernum=(Integer)session.getAttribute("usernum");
		model.addAttribute("wv",gs.getList(usernum));	
		return "gift/giftbox";
	}
	
	@RequestMapping(value="/gift/gifthistory")
	public String gifthistory(int giftnum, Model model,HttpSession session){
		int usernum=(Integer)session.getAttribute("usernum");
		int n=gs.inserthistory(new GiftHistoryVo(0, giftnum, usernum, null));
		System.out.println(n);
		return "redirect:/gift/giftbox";
	}
}
