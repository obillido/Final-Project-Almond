package project.app.almond.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String insert(int epinum,int usernum,String comment,int ref){
		int lev=1,step=1;
		if(ref==0) ref=cs.getRef(epinum)+1;
		else{
			lev=2;
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("epinum", epinum);
			map.put("ref",ref);
			step=cs.getStep(map);
		}
		int n=cs.insert(new CommentsVo(0, epinum, usernum, comment, ref, lev, step, null));
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		if(n>0) sb.append("<code>success</code>");
		else    sb.append("<code>fail</code>");
		return sb.toString();
	}
	@RequestMapping(value="/webcontents/comments/list",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String commentsList(int epinum,int usernum){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("epinum",epinum);
		map.put("usernum",usernum);
		List<CommentsInfoVo> list=cs.getList(map);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
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
	public String changeLikesCnt(int usernum,int commnum,int type){
		CommLikesVo vo=new CommLikesVo(0,usernum,commnum,type);
		int n=0;
		if(cls.isExist(vo)==null){
			n=cls.insert(vo);
		}else{
			n=cls.update(vo);
		}
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		if(n>0) sb.append("<code>success</code>");
		else	sb.append("<code>fail</code>");
		return sb.toString();
	}
}
