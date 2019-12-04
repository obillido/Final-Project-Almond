package project.app.almond.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.app.almond.vo.WebcontentsVo;

@Controller
public class WebtoonController {
	@RequestMapping("/webtoon/webtoonpage")
	public String webtoonpage(){
		return ".webtoon.webtoonpage";
	}

	@RequestMapping(value="/webtoon/category2",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String category2(){
		ArrayList<WebcontentsVo> list=new ArrayList<WebcontentsVo>();	
		list.add(new WebcontentsVo(1, "제목1", 1, "웹툰", "소개글1", 900, 0, "savedimgname1", 1, 12, 0));
		list.add(new WebcontentsVo(2, "제목2", 1, "순정", "소개글2", 900, 0, "savedimgname2", 1, 12, 0));
		list.add(new WebcontentsVo(3, "제목3", 1, "드라마", "소개글3", 900, 0, "savedimgname3", 1, 12, 0));
		
		StringBuffer sb=new StringBuffer();
        sb.append("<?xml version='1.0' encoding='utf-8'?>");
        sb.append("<webtoons>");
        for(WebcontentsVo vo:list){
        	sb.append("<webtoon>");
            sb.append("<contnum>" + vo.getContnum() + "</contnum>");
            sb.append("<title>" + vo.getTitle() + "</title>");
            sb.append("<cultype>" + vo.getCultype() + "</cultype>");
            sb.append("<genre>" + vo.getGenre() + "</genre>");
            sb.append("<outline>" + vo.getOutline() + "</outline>");
            sb.append("<price>" + vo.getPrice() + "</price>");
            sb.append("<waiting>" + vo.getWaiting() + "</waiting>");
            sb.append("<img>" + vo.getImg() + "</img>");
            sb.append("<completiontype>" + vo.getCompletiontype() + "</completiontype>");
            sb.append("<agegrade>" + vo.getAgegrade()+ "</agegrade>");
            sb.append("<freenum>" + vo.getFreenum() + "</freenum>");
            sb.append("</webtoon>");
        }
        sb.append("</webtoons>");
        return sb.toString();
	}
}
