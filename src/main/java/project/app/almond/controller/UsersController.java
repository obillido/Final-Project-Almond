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
	@Autowired private UsersService service;
	@RequestMapping(value="/emailcheck",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String emailcheck(String email){
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		System.out.println(email);
		UsersVo vo=service.emailcheck(email);
		if(vo==null) sb.append("<check>yes</check>");
		else 		 sb.append("<check>no</check>");
		sb.append("</result>");
		return sb.toString();
	}
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String joinForm(){
		return ".users.join";
	}
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(UsersVo vo) {
		int n=service.insert(vo);
		if(n>0) {
			return "redirect:/";
		}else {
			return ".users.fail";
		}
	}
	@RequestMapping(value="/searchpwd",method=RequestMethod.GET)
	public String searchpwd() {
		return ".users.searchpwd";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginForm() {
		return ".users.login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String email, String pwd,HttpSession session) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("email", email);
		map.put("pwd", pwd);
		HashMap<String, Object> user=service.login(map);
		if(user!=null) {
			session.setAttribute("email", email);
			return "redirect:/";
			}else{
				return ".users.login";
			}
		}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
