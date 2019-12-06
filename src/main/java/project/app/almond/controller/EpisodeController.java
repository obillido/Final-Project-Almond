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
	@RequestMapping(value="/webcontents/episode/regi",method=RequestMethod.GET)
	public String insertForm(int cultype,int contnum,Model model){

		if(cultype==1||cultype==2) model.addAttribute("contInfo",ws.getInfoBook(contnum));
		else model.addAttribute("contInfo",ws.getInfoVideo(contnum));
		model.addAttribute("epnum",es.getEpnum(contnum)+1);
		model.addAttribute("contnum",contnum);
		return ".webcontents.episode.regiForm";
	}
	@RequestMapping(value="/webcontents/episode/regi",method=RequestMethod.POST)
	public String insert(int cultype,int contnum,String content,int epnum,MultipartFile file1,Model model){
		String uploadPath="C:/Users/JHTA/git/Final-Project-Almond/src/main/webapp/resources/webcontents/"+cultype;
		//"C:/web/spring/almond/src/main/webapp/resources/webcontents/"+cultype;
		String img=UUID.randomUUID()+"_"+file1.getOriginalFilename();
		int n=es.insert(new EpisodeVo(0, contnum, null, 0, img, content, epnum));
		if(n>0){
			try{
				InputStream is=file1.getInputStream();
				FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+img);
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
		return ".webcontents.contentsInfo";
	}
}
