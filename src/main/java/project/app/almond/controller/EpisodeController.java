package project.app.almond.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import project.app.almond.service.EpisodeService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.EpisodeVo;

@Controller
public class EpisodeController {
	@Autowired private WebcontentsService ws;
	@Autowired private EpisodeService es;
	@RequestMapping("/webcontents/contents")
	public String contentsInfo(int contnum,int cultype,Model model){
		if(cultype==1 || cultype==2) model.addAttribute("contInfo",ws.getInfoBook(contnum));
		else model.addAttribute("contInfo",ws.getInfoVideo(contnum));
		model.addAttribute("epiList",es.getList(contnum));
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
	public String insert(int cultype,int contnum,String content,String subtitle,int epnum,MultipartFile file1,MultipartFile file2,Model model){
		String uploadPath="C:/web/spring/almond/src/main/webapp/resources/webcontents/"+cultype;
				//"C:/Users/JHTA/git/Final-Project-Almond/src/main/webapp/resources/webcontents/"+cultype;
		//"C:/web/spring/almond/src/main/webapp/resources/webcontents/"+cultype;
		String thumbnail=UUID.randomUUID()+"_"+file2.getOriginalFilename();
		String img=UUID.randomUUID()+"_"+file1.getOriginalFilename();
		System.out.println(contnum+","+thumbnail+","+subtitle+","+img+","+content+","+epnum);
		int n=es.insert(new EpisodeVo(0, contnum, null, 0, thumbnail, subtitle, img, content, epnum));
		if(n>0){
			try{
				InputStream is=file1.getInputStream();
				FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+img);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				is=file2.getInputStream();
				fos=new FileOutputStream(uploadPath+"\\"+img);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
			}catch(IOException ie){
				ie.printStackTrace();
				model.addAttribute("code","등록실패");
			}
		}else{
			model.addAttribute("code","등록이 성공적으로 완료되었습니다.");
		}
		if(cultype==1 || cultype==2) model.addAttribute("contInfo",ws.getInfoBook(contnum));
		else model.addAttribute("contInfo",ws.getInfoVideo(contnum));
		model.addAttribute("epiList",es.getList(contnum));
		return ".webcontents.contentsInfo";
	}
}
