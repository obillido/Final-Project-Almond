package project.app.almond.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.app.almond.service.UsersService;
import project.app.almond.vo.UsersVo;

@Controller
public class UsersController {
	@Autowired private UsersService us;
	@RequestMapping(value="/users/emailcheck",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String emailcheck(String email){
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		System.out.println(email);
		UsersVo vo=us.emailcheck(email);
		if(vo==null) sb.append("<check>yes</check>");
		else 		 sb.append("<check>no</check>");
		sb.append("</result>");
		return sb.toString();
	}
	@RequestMapping(value="/users/join",method=RequestMethod.GET)
	public String joinForm(){
		return ".users.join";
	}
	@RequestMapping(value="/users/join",method=RequestMethod.POST)
	public String join(UsersVo vo) {
		int n=us.insert(vo);
		if(n>0) {
			return ".users.login";
		}else {
			return ".users.fail";
		}
	}
	@RequestMapping(value="/users/searchpwd",method=RequestMethod.GET)
	public String searchpwd() {
		return ".users.searchpwd";
	}
	@RequestMapping(value="/users/login",method=RequestMethod.GET)
	public String loginForm() {
		return ".users.login";
	}
	@RequestMapping(value="/users/login",method=RequestMethod.POST)
	public String login(UsersVo vo,HttpSession session) {
		System.out.println();
		UsersVo uvo=us.login(vo);
		if(uvo!=null) {
			session.setAttribute("usernum", uvo.getUsernum());
			session.setAttribute("nickname", uvo.getNickname());
			if(uvo.getStatus()==0) session.setAttribute("userStatus", "admin");
			return "redirect:/";
		}else{
			return ".users.login";
		}
	}
	@RequestMapping(value="/users/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
