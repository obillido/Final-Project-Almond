package project.app.almond.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.app.almond.service.TicketService;

@Controller
public class GiftController {
	@Autowired private TicketService ts;
	
	@RequestMapping("/gift/gift")
	public String giftinsert(){
		return ".gift.gift";
	}
	@RequestMapping(value="/gift/giftList",method=RequestMethod.GET)
	public String giftlist(int cultype,Model model){
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
		return ".gift.giftlist";
	}
	
	
}
