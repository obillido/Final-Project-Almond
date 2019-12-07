package project.app.almond.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import project.app.almond.service.EpisodeService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.EpisodeVo;
import project.app.almond.vo.WebcontentsVo;

@Controller
public class EpisodeController {
	@Autowired private WebcontentsService ws;
	@Autowired private EpisodeService es;
	@RequestMapping("/webcontents/episode/list")
	public String list(int contnum,int cultype,@RequestParam(value="align",defaultValue="desc")String align,String code,Model model){
		model.addAttribute("code",code);
		if(cultype==1 || cultype==2) model.addAttribute("contInfo",ws.getInfoBook(contnum));
		else model.addAttribute("contInfo",ws.getInfoVideo(contnum));
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("contnum", contnum);
		map.put("align", align);
		model.addAttribute("epiList",es.getList(map));
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
		String uploadPath="C:/web/spring/almond/src/main/webapp/resources/webcontents/"+cultype;
				//"C:/Users/JHTA/git/Final-Project-Almond/src/main/webapp/resources/webcontents/"+cultype;
		//"C:/web/spri ng/almond/src/main/webapp/resources/webcontents/"+cultype;
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
			}catch(IOException ie){
				ie.printStackTrace();
				model.addAttribute("code","0");
			}finally{
				model.addAttribute("code","1");
			}
		}else{
			model.addAttribute("code","0");
		}
		model.addAttribute("cultype",cultype);
		model.addAttribute("contnum",contnum);
		return "redirect:/webcontents/episode/list";
	}
	@RequestMapping("/webcontents/episode/content")
	public String epiInfo(int contnum,int epinum,Model model){
		model.addAttribute("wvo",ws.getInfo(contnum));
		model.addAttribute("evo",es.getInfo(epinum));
		return ".webcontents.episode.content";
	}
}
