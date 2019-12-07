package project.app.almond.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
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

import project.app.almond.service.TicketService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.BookVo;
import project.app.almond.vo.VideoVo;
import project.app.almond.vo.WebcontentsBookVo;
import project.app.almond.vo.WebcontentsVo;

@Controller
public class WebcontentsController {
	@Autowired private TicketService ts;
	@Autowired private WebcontentsService ws;
	@RequestMapping(value="/webcontents/choice")
	public String regiFormChoice(){
		return ".webcontents.choice";
	}
	@RequestMapping(value="/webcontents/regiForm",method=RequestMethod.GET)
	public String regiForm(int cultype,Model model){
		model.addAttribute("cultype",cultype);
		ArrayList<String> genreList=new ArrayList<String>();
		if(cultype==1){
			genreList.add("로맨스");
			genreList.add("소년");
			genreList.add("드라마");
			genreList.add("무협");
		}else if(cultype==2){
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
		model.addAttribute("ticketList",ts.getInfoList(cultype));
		return ".webcontents.regiForm";
	}
	
	@RequestMapping(value="/webcontents/regi",method=RequestMethod.POST)
	public String regi(int cultype,String title,String genre,String outline,
			int tknum,int waiting,int agegrade,int freenum,int completiontype,
			String director,String actor,@RequestParam(value="runtime",defaultValue="100")int runtime,Date proddate,
			String writer,String illustrator,String publisher,String dayofweek,
			MultipartFile file1,HttpSession session,Model model){
		String uploadPath="C:/Users/JHTA/git/Final-Project-Almond/src/main/webapp/resources/webcontents/"+cultype;
		//"C:/web/spring/almond/src/main/webapp/resources/webcontents/"+cultype;
		//session.getServletContext().getRealPath("/resources/webcontents/"+cultype);
		String img=UUID.randomUUID()+"_"+file1.getOriginalFilename();
		WebcontentsVo wvo=new WebcontentsVo(0, title, cultype, genre, outline, tknum, waiting, img, completiontype, agegrade, freenum,0,0);
		int n=1;
		if(cultype==1||cultype==2){
			BookVo bvo=new BookVo(0, writer, illustrator, publisher, dayofweek);
			n=ws.insert(wvo, bvo);
		}else{
			VideoVo vvo=new VideoVo(0, director, actor, runtime, proddate);
			n=ws.insert(wvo, vvo);
		}
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
			model.addAttribute("code","성공적으로 등록이 완료되었습니다.");
		}
		else model.addAttribute("code","등록실패");
		return ".webcontents.choice";
	}
	
	@RequestMapping(value="/webcontents/list",method=RequestMethod.GET)
	public String list(int cultype,String genre,Model model){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cultype",cultype);
		map.put("genre",genre);
		model.addAttribute("cultype",cultype);
		model.addAttribute("genreList",ws.getGenreList(cultype));
		if(cultype==1||cultype==2) model.addAttribute("list",ws.getListBook(map));
		else model.addAttribute("list",ws.getListVideo(map));
		return ".webcontents.list";
	}
	@RequestMapping(value="/webcontents/listonday",method=RequestMethod.POST)
	public String listonday(String dayofweek,Model model){
		System.out.println("dayofweek:" + dayofweek);
		List<WebcontentsBookVo> daylist=ws.listonday(dayofweek);
		model.addAttribute("daylist",daylist);
		return ".webcontents.list";
	}
}
