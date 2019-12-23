package project.app.almond.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.app.almond.service.AlarmService;
import project.app.almond.vo.AlarmVo;

@Controller
public class AlarmController {
	@Autowired private AlarmService as;
	
	@RequestMapping(value="/alarm/list",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getList(HttpSession session){
		int usernum=(Integer)session.getAttribute("usernum");
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		for(AlarmVo vo:as.getWebList(usernum)){
			sb.append("<webAlarmList>");
			sb.append("<alarmnum>"+vo.getAlarmnum()+"</alarmnum>");
			sb.append("<title>"+vo.getTitle()+"</title>");
			sb.append("<content>"+vo.getContent()+"</content>");
			sb.append("<regdate>"+vo.getRegdate()+"</regdate>");
			sb.append("<num>"+vo.getNum()+"</num>");
			sb.append("<status>"+vo.getStatus()+"</status>");
			sb.append("</webAlarmList>");
		}
		for(AlarmVo vo:as.getCommList(usernum)){
			sb.append("<commAlarmList>");
			sb.append("<alarmnum>"+vo.getAlarmnum()+"</alarmnum>");
			sb.append("<title>"+vo.getTitle()+"</title>");
			sb.append("<content>"+vo.getContent()+"</content>");
			sb.append("<regdate>"+vo.getRegdate()+"</regdate>");
			sb.append("<num>"+vo.getNum()+"</num>");
			sb.append("<status>"+vo.getStatus()+"</status>");
			sb.append("</commAlarmList>");
		}
		for(AlarmVo vo:as.getEventList(usernum)){
			sb.append("<eventAlarmList>");
			sb.append("<alarmnum>"+vo.getAlarmnum()+"</alarmnum>");
			sb.append("<title>"+vo.getTitle()+"</title>");
			sb.append("<content>"+vo.getContent()+"</content>");
			sb.append("<regdate>"+vo.getRegdate()+"</regdate>");
			sb.append("<num>"+vo.getNum()+"</num>");
			sb.append("<status>"+vo.getStatus()+"</status>");
			sb.append("</eventAlarmList>");
		}
		sb.append("<cnt>"+as.getCnt(usernum)+"</cnt>");
		sb.append("</result>");
		return sb.toString();
	}
	
	@RequestMapping(value="/alarm/getCnt",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getCnt(HttpSession session){
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		sb.append("<cnt>"+as.getCnt((Integer)session.getAttribute("usernum"))+"</cnt>");
		sb.append("</result>");
		return sb.toString();
	}
	
	
	@RequestMapping(value="alarm/passage")
	public String passage(int alarmnum, int status, int num){
		as.update(alarmnum);
		if(status<=25){
			return "redirect:/webcontents/episode/list?contnum="+num;
		}
		return "redirect:/";
	}
}
