package project.app.almond.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import project.app.almond.service.TicketService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.BookVo;
import project.app.almond.vo.ScoreVo;
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
		String uploadPath="C:/web/spring/almond/src/main/webapp/resources/webcontents/"+cultype;
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
	@RequestMapping(value="/webcontents/listonday",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String listonday(String dayofweek){
		List<WebcontentsBookVo> daylist=ws.listonday(dayofweek);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<wrap>");
		for(WebcontentsBookVo vo:daylist){
			sb.append("<result>");
			sb.append("<cultype>" + 1 +"</cultype>");
			sb.append("<contnum>"+vo.getContnum()+"</contnum>");
			sb.append("<cultype>"+vo.getCultype()+"</cultype>");
			sb.append("<title>"+vo.getTitle()+"</title>");
			sb.append("<genre>"+vo.getGenre()+"</genre>");
			sb.append("<outline>"+vo.getOutline()+"</outline>");
			sb.append("<img>"+vo.getImg()+"</img>");
			sb.append("</result>");
		}
		sb.append("</wrap>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/jakpum",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String jakpum(int cultype){
		List<WebcontentsVo> list=ws.jakpum(cultype);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		for(WebcontentsVo vo:list){
			sb.append("<jakpum>");
			sb.append("<contnum>"+vo.getContnum()+"</contnum>");
			sb.append("<cultype>"+vo.getCultype()+"</cultype>");
			sb.append("<title>"+vo.getTitle()+"</title>");
			sb.append("<genre>"+vo.getGenre()+"</genre>");
			sb.append("<outline>"+vo.getOutline()+"</outline>");
			sb.append("<img>"+vo.getImg()+"</img>");
			sb.append("<readernum>"+vo.getReadernum()+"</readernum>");
			sb.append("</jakpum>");
		}
		sb.append("</result>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/byReadernum",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String byReadernum(int cultype){
		List<WebcontentsVo> list=ws.byReadernum(cultype);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<wrap>");
		for(WebcontentsVo vo:list){
			sb.append("<result>");
			sb.append("<contnum>"+vo.getContnum()+"</contnum>");
			sb.append("<cultype>"+vo.getCultype()+"</cultype>");
			sb.append("<title>"+vo.getTitle()+"</title>");
			sb.append("<genre>"+vo.getGenre()+"</genre>");
			sb.append("<outline>"+vo.getOutline()+"</outline>");
			sb.append("<img>"+vo.getImg()+"</img>");
			sb.append("<readernum>"+vo.getReadernum()+"</readernum>");
			sb.append("</result>");
			
		}
		sb.append("</wrap>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/byHit",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String byHit(int cultype){
		List<HashMap<String, Object>> list=ws.byHit(cultype);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<wrap>");
		for(HashMap<String, Object> map:list){
			sb.append("<result>");
			sb.append("<contnum>"+ map.get("CONTNUM") +"</contnum>");
			sb.append("<cultype>"+ map.get("CULTYPE") +"</cultype>");
			sb.append("<title>"+ map.get("TITLE") +"</title>");
			sb.append("<genre>"+ map.get("GENRE") +"</genre>");
			sb.append("<outline>"+ map.get("OUTLINE") +"</outline>");
			sb.append("<img>"+ map.get("IMG") +"</img>");
			sb.append("<readernum>"+ map.get("READERNUM") +"</readernum>");
			sb.append("<tot>"+ map.get("TOT") +"</tot>");
			sb.append("</result>");
		}
		sb.append("</wrap>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/byLikes",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String byLikes(int cultype){
		List<HashMap<String, Object>> list=ws.byLikes(cultype);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<wrap>");
		for(HashMap<String, Object> map:list){
			sb.append("<result>");
			sb.append("<cnt>" +  map.get("CNT") + "</cnt>");
			sb.append("<contnum>" +  map.get("CONTNUM") + "</contnum>");
			
			int contnum=((BigDecimal)map.get("CONTNUM")).intValue();
			WebcontentsVo wvo=ws.getInfo(contnum);
			
			sb.append("<title>" +  wvo.getTitle() + "</title>");
			sb.append("<img>" +  wvo.getImg() + "</img>");
			sb.append("<cultype>" +  wvo.getCultype() + "</cultype>");
			sb.append("</result>");
		}
		sb.append("</wrap>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/byScore",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String byScore(int cultype){
		List<HashMap<String, Object>> list=ws.byScore(cultype);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<wrap>");
		for(HashMap<String, Object> map:list){
			sb.append("<result>");
			sb.append("<score>" + map.get("TS") + "</score>");
			sb.append("<contnum>" +  map.get("CONTNUM") + "</contnum>");
			
			int contnum=((BigDecimal)map.get("CONTNUM")).intValue();
			WebcontentsVo wvo=ws.getInfo(contnum);
			
			sb.append("<title>" +  wvo.getTitle() + "</title>");
			sb.append("<img>" +  wvo.getImg() + "</img>");
			sb.append("<cultype>" +  wvo.getCultype() + "</cultype>");
			
			sb.append("</result>");
		}
		sb.append("</wrap>");
		return sb.toString();
	}

    //검색 기능
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public String search(String keyword,Model model){
		List<WebcontentsVo> list=ws.search(keyword);
		model.addAttribute("list", list);
		model.addAttribute("keyword",keyword);
		return ".searchResult";
	}
	
	//별점 기능
	@RequestMapping(value="/webcontents/score",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String byScore(int stars,HttpSession session,int epinum){
		int usernum=(Integer)session.getAttribute("usernum");
		
		StringBuffer sb=new StringBuffer();
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("usernum", usernum);
		map.put("epinum", epinum);
		ScoreVo evo=ws.existInScore(map);
		if(evo==null){
			ScoreVo vo=new ScoreVo(0, epinum, usernum, stars);
			int n=ws.score(vo);
			
			sb.append("<?xml version='1.0' encoding='utf-8'?>");
			sb.append("<wrap>");
			if(n>0){
				sb.append("<code>성공</code>");
			}else{
				sb.append("<code>실패</code>");
			}
			sb.append("</wrap>");
		}else{
			sb.append("<?xml version='1.0' encoding='utf-8'?>");
			sb.append("<wrap>");
			sb.append("<code>존재</code>");
			sb.append("</wrap>");
		}
		
		
		return sb.toString();
	}
}
