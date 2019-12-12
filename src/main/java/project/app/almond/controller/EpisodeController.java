package project.app.almond.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.app.almond.service.EpisodeService;
import project.app.almond.service.ReadingService;
import project.app.almond.service.TicketStockService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.EpisodeVo;
import project.app.almond.vo.MylistVo;
import project.app.almond.vo.ReadingVo;
import project.app.almond.vo.TicketStockVo;
import project.app.almond.vo.WebcontentsVo;

@Controller
public class EpisodeController {
	@Autowired private WebcontentsService ws;
	@Autowired private EpisodeService es;
	@Autowired private ReadingService rs;
	@Autowired private TicketStockService tss;
	@RequestMapping("/webcontents/episode/list")
	public String list(int contnum,@RequestParam(value="align",defaultValue="desc")String align,HttpSession session,Model model){
		int cultype=ws.getInfo(contnum).getCultype();
		if(cultype==1 || cultype==2) model.addAttribute("wvo",ws.getInfoBook(contnum));
		else 						 model.addAttribute("wvo",ws.getInfoVideo(contnum));
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("contnum", contnum);
		map.put("align", align);
		Object uu=session.getAttribute("usernum");
		if(uu!=null){
			int usernum=(Integer)uu;
			map.put("usernum",usernum);
			model.addAttribute("epiList",es.getListforUser(map));
			TicketStockVo tsvo1=tss.getInfo(new TicketStockVo(0, usernum, contnum, 1, 0));
			TicketStockVo tsvo2=tss.getInfo(new TicketStockVo(0, usernum, contnum, 2, 0));
			int own=0,rental=0;
			if(tsvo1!=null) own=tsvo1.getCnt();
			if(tsvo2!=null) rental=tsvo2.getCnt();
			model.addAttribute("own",own);
			model.addAttribute("rental",rental);
			if(own!=0 && rental!=0)	model.addAttribute("showTicketType",3);
			else if(own==0 && rental==0) model.addAttribute("showTicketType",4);
			else if(own==0)		model.addAttribute("showTicketType",2);
			else if(rental==0)	model.addAttribute("showTicketType",1);
		}else{
			model.addAttribute("epiList",es.getList(map));
		}
		return ".webcontents.episode.list";
	}
	@RequestMapping(value="/webcontents/episode/regi",method=RequestMethod.GET)
	public String insertForm(int cultype,int contnum,Model model){
		if(cultype==1||cultype==2) model.addAttribute("contInfo",ws.getInfoBook(contnum));
		else model.addAttribute("contInfo",ws.getInfoVideo(contnum));
		model.addAttribute("cultype",cultype);
		model.addAttribute("contnum",contnum);
		model.addAttribute("epnum",(es.getEpnum(contnum)+1));
		return ".webcontents.episode.regiForm";
	}
	@RequestMapping(value="/webcontents/episode/regi",method=RequestMethod.POST)
	public String insert(int cultype,int contnum,String content,String subtitle,int epnum,List<MultipartFile> file1,Model model){
		String uploadPath="C:/Users/JHTA/git/Final-Project-Almond/src/main/webapp/resources/webcontents/"+cultype;
		//"C:/web/spring/almond/src/main/webapp/resources/webcontents/"+cultype;
		String thumbnail=UUID.randomUUID()+"_"+file1.get(0).getOriginalFilename();
		String img=UUID.randomUUID()+"_"+file1.get(1).getOriginalFilename();
		int n=es.insert(new EpisodeVo(0, contnum, null, 0, thumbnail, subtitle, img, content, epnum));
		if(n>0){
			try{
				InputStream is=file1.get(0).getInputStream();
				FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+thumbnail);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				is=file1.get(1).getInputStream();
				fos=new FileOutputStream(uploadPath+"\\"+img);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				model.addAttribute("msg","성공적으로 등록되었습니다.");
			}catch(IOException ie){
				ie.printStackTrace();
				model.addAttribute("msg","등록실패");
			}
		}else{
			model.addAttribute("msg","등록실패");
		}
		model.addAttribute("cultype",cultype);
		model.addAttribute("contnum",contnum);
		return "redirect:/webcontents/episode/list";
	}
	@RequestMapping(value="/webcontents/episode/content",method=RequestMethod.POST)
	public String epiInfo(int contnum,int epinum,HttpSession session,@RequestParam(value="type",defaultValue="0")int type,Model model){
		WebcontentsVo wvo=ws.getInfo(contnum);
		EpisodeVo evo=es.getInfo(epinum);
		Object uu=session.getAttribute("usernum");
		Date sysdate=new Date(new java.util.Date().getTime());
		if(uu!=null){
			int usernum=(Integer)uu, n=0;
			n=rs.insert(new ReadingVo(0, epinum, usernum, sysdate, type), new MylistVo(0, contnum, usernum, 1, sysdate));
			if(n>0){
				model.addAttribute("wvo",wvo);
				model.addAttribute("evo",evo);
				return ".webcontents.episode.content";
			}else{
				model.addAttribute("msg","열람실패");
				return "redirect:/webcontents/episode/list";
			}
		}
		model.addAttribute("wvo",wvo);
		model.addAttribute("evo",evo);
		return ".webcontents.episode.content";
	}
}
