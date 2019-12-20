package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.app.almond.service.CommLikesService;
import project.app.almond.service.CommentsService;
import project.app.almond.vo.CommLikesVo;
import project.app.almond.vo.CommentsInfoVo;
import project.app.almond.vo.CommentsVo;

@Controller
public class CommentsController {
	@Autowired private CommentsService cs;
	@Autowired private CommLikesService cls;
	@RequestMapping(value="/webcontents/comments/insert",produces="application/xml;chatset=utf-8")
	@ResponseBody
	public String insert(int epinum,String comment,int ref, HttpSession session){
		int lev=1,step=1;
		if(ref==0) ref=cs.getRef(epinum)+1;
		else{
			lev=2;
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("epinum", epinum);
			map.put("ref",ref);
			step=cs.getStep(map);
		}
		int n=cs.insert(new CommentsVo(0, epinum, (Integer)session.getAttribute("usernum"), comment, ref, lev, step, null));
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		if(n>0) sb.append("<code>success</code>");
		else    sb.append("<code>fail</code>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/comments/list",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String commentsList(int epinum,HttpSession session){
		int usernum=-1;
		Object uu=session.getAttribute("usernum");
		if(uu!=null) usernum=(Integer)uu;
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("epinum",epinum);
		map.put("usernum",usernum);
		List<CommentsInfoVo> list=cs.getList(map);
		List<CommentsInfoVo> bestList=cs.getBestList(map);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		for(CommentsInfoVo vo:bestList){
			sb.append("<bestComment>");
			sb.append("<commnum>"+vo.getCommnum()+"</commnum>");
			sb.append("<epinum>"+vo.getEpinum()+"</epinum>");
			sb.append("<usernum>"+vo.getUsernum()+"</usernum>");
			sb.append("<content>"+vo.getContent()+"</content>");
			sb.append("<ref>"+vo.getRef()+"</ref>");
			sb.append("<lev>"+vo.getLev()+"</lev>");
			sb.append("<step>"+vo.getStep()+"</step>");
			sb.append("<regdate>"+vo.getRegdate()+"</regdate>");
			sb.append("<nickname>"+vo.getNickname()+"</nickname>");
			sb.append("<profileimg>"+vo.getProfileimg()+"</profileimg>");
			sb.append("<cntlike>"+vo.getCntlike()+"</cntlike>");
			sb.append("<cnthate>"+vo.getCnthate()+"</cnthate>");
			sb.append("<mytype>"+vo.getMytype()+"</mytype>");
			sb.append("</bestComment>");
		}
		for(CommentsInfoVo vo:list){
			sb.append("<comment>");
			sb.append("<commnum>"+vo.getCommnum()+"</commnum>");
			sb.append("<epinum>"+vo.getEpinum()+"</epinum>");
			sb.append("<usernum>"+vo.getUsernum()+"</usernum>");
			sb.append("<content>"+vo.getContent()+"</content>");
			sb.append("<ref>"+vo.getRef()+"</ref>");
			sb.append("<lev>"+vo.getLev()+"</lev>");
			sb.append("<step>"+vo.getStep()+"</step>");
			sb.append("<regdate>"+vo.getRegdate()+"</regdate>");
			sb.append("<nickname>"+vo.getNickname()+"</nickname>");
			sb.append("<profileimg>"+vo.getProfileimg()+"</profileimg>");
			sb.append("<cntlike>"+vo.getCntlike()+"</cntlike>");
			sb.append("<cnthate>"+vo.getCnthate()+"</cnthate>");
			sb.append("<mytype>"+vo.getMytype()+"</mytype>");
			sb.append("</comment>");
		}
		sb.append("</result>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/comments/changeLikesCnt",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String changeLikesCnt(int commnum,int type,HttpSession session){
		int usernum=-1;
		Object uu=session.getAttribute("usernum");
		if(uu!=null) usernum=(Integer)uu;
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		CommLikesVo vo=new CommLikesVo(0,usernum,commnum,type);
		CommLikesVo vo2=cls.isExist(vo);
		int n=0;
		if(vo2==null){
			n=cls.insert(vo);
		}else{
			if(Math.abs(vo2.getType()-type)==1){
				sb.append("<selected>already</selected>");
				return sb.toString();
			}
			n=cls.update(vo);
		}
		sb.append("<result>");
		if(n>0){
			sb.append("<code>success</code>");
			vo.setType(Math.abs(type));
			sb.append("<cnt>"+cls.getCnt(vo)+"</cnt>");
		}
		else sb.append("<code>fail</code>");
		sb.append("</result>");
		return sb.toString();
	}
}
