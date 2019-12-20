package project.app.almond.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.app.almond.service.AlarmService;
import project.app.almond.service.MylistService;
import project.app.almond.vo.AlarmVo;
import project.app.almond.vo.MylistVo;
import project.app.almond.vo.WebcontentsVo;

@Controller
public class AlarmController {
	@Autowired private AlarmService as;
	
	@RequestMapping(value="/alarm/list",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getList(HttpSession session){
		int usernum=(Integer)session.getAttribute("usernum");
		List<AlarmVo> list=as.getList(usernum);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		for(AlarmVo vo:list){
			sb.append("<alarm>");
			sb.append("<title>"+vo.getTitle()+"</title>");
			sb.append("<content>"+vo.getContent()+"</content>");
			sb.append("<regdate>"+vo.getRegdate()+"</regdate>");
			sb.append("</alarm>");
		}
		sb.append("<cnt>"+as.getCnt(usernum)+"</cnt>");
		sb.append("</result>");
		return sb.toString();
	}
	

}
