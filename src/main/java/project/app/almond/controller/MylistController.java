package project.app.almond.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.app.almond.service.MylistService;
import project.app.almond.service.WebcontentsService;
import project.app.almond.vo.MylistVo;
import project.app.almond.vo.WebcontentsVo;

@Controller
public class MylistController {
	@Autowired MylistService ms;
	@Autowired WebcontentsService ws;
	
	@RequestMapping(value="/mylist/list",method=RequestMethod.GET)
	public String mylist(HttpSession session,Model model){
		int usernum=(Integer)session.getAttribute("usernum");
		ArrayList<HashMap<String, Object>> array=new ArrayList<HashMap<String,Object>>();
		List<MylistVo> list=ms.list(usernum);
		for(MylistVo vo:list){
			int mylistnum=vo.getMylistnum();
			int contnum=vo.getContnum();
			Date readingdate=vo.getReadingdate();
			WebcontentsVo wvo=ws.getInfo(contnum);
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("mylistnum", mylistnum);
			map.put("contnum", contnum);
			map.put("readingdate", readingdate);
			map.put("title", wvo.getTitle());
			map.put("cultype", wvo.getCultype());
			map.put("img", wvo.getImg());
			map.put("completiontype", wvo.getCompletiontype());
			map.put("alaram", vo.getAlaram());
			array.add(map);
		}
        model.addAttribute("list", array);	
		return ".mylist.mylist";
	}
	@RequestMapping(value="/mylist/delete",method=RequestMethod.GET)
	public String delete(int mylistnum){
		System.out.println(mylistnum);
		ms.delFromList(mylistnum);
		return "redirect:/mylist/list";	
	}
	@RequestMapping(value="/mylist/array1",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String array1(HttpSession session,int cultype){
		int usernum=(Integer)session.getAttribute("usernum");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("usernum", usernum);
		map.put("cultype", cultype);
		List<HashMap<String, Object>> list=ms.array1(map);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<wrap>");
		for(HashMap<String, Object> mymap:list){
			sb.append("<result>");
			sb.append("<contnum>" +  mymap.get("CONTNUM") + "</contnum>");
			sb.append("<title>" + mymap.get("TITLE") + "</title>");
			sb.append("<img>" + mymap.get("IMG") + "</img>");
			sb.append("<cultype>" + mymap.get("CULTYPE") + "</cultype>");
			sb.append("<completiontype>" + mymap.get("COMPLETIONTYPE") + "</completiontype>");
			sb.append("<mylistnum>" + mymap.get("MYLISTNUM") + "</mylistnum>");
			sb.append("<alaram>" + mymap.get("ALARAM") + "</alaram>");
			sb.append("<readingdate>" + mymap.get("READINGDATE") + "</readingdate>");
			sb.append("</result>");
		}
		sb.append("</wrap>");
		return sb.toString();
	}
}
