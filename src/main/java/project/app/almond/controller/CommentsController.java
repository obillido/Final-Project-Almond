package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.app.almond.service.CommentsService;
import project.app.almond.vo.CommentsVo;

@Controller
public class CommentsController {
	@Autowired private CommentsService cs;
	@RequestMapping(value="/webcontents/comments/insert",produces="application/xml;chatset=utf-8")
	public String insert(int epinum,int usernum,String content,int ref){
		System.out.println(epinum);
		int lev=1,step=1;
		if(ref==0) ref=cs.getRef(epinum);
		else{
			lev=2;
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("epinum", epinum);
			map.put("ref",ref);
			step=cs.getStep(map);
		}
		int n=cs.insert(new CommentsVo(0, epinum, usernum, content, ref, lev, step, null));
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		if(n>0) sb.append("<code>success</code>");
		else    sb.append("<code>fail</code>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/comments/list",produces="application/xml;charset=utf-8")
	public String commentsList(int epinum){
		List<CommentsVo> list=cs.getList(epinum);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		for(CommentsVo vo:list){
			sb.append("<comments>");
			sb.append("<commnum>"+vo.getCommnum()+"</commnum>");
			sb.append("<epinum>"+vo.getEpinum()+"</epinum>");
			sb.append("<usernum>"+vo.getUsernum()+"</usernum>");
			sb.append("<content>"+vo.getContent()+"</content>");
			sb.append("<ref>"+vo.getRef()+"</ref>");
			sb.append("<lev>"+vo.getLev()+"</lev>");
			sb.append("<step>"+vo.getStep()+"</step>");
			sb.append("<regdate>"+vo.getRegdate()+"</regdate>");
			sb.append("</comments>");
		}
		sb.append("</result>");
		return sb.toString();
	}
}
