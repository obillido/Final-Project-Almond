package project.app.almond.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping(value="/mypage/profile",method=RequestMethod.GET)
	public String getProfile(HttpSession session,Model model){
		int usernum=(Integer)session.getAttribute("usernum");
		UsersVo vo=us.getInfo(usernum);
		model.addAttribute("vo", vo);
		return ".mypage.profile";
	}
	@RequestMapping(value="/mypage/chgprofile",method=RequestMethod.POST)
	public String chgProfile(HttpSession session,Model model,MultipartFile file,String nickname){
		int usernum=(Integer)session.getAttribute("usernum");
		
		String uploadPath="C:/Users/JHTA/git/Final-Project-Almond/src/main/webapp/resources/profileimages";
		String orgfilename=file.getOriginalFilename();
		String savefilename=UUID.randomUUID() + "_" + orgfilename;
		
		try{
			InputStream is=file.getInputStream();
			FileOutputStream fos=new FileOutputStream(uploadPath + "\\" + savefilename);
            FileCopyUtils.copy(is,fos);
            is.close();
            fos.close();
            UsersVo vo=new UsersVo(usernum, null, null, null, nickname, savefilename, 0, 0);
            int n=us.chgProfile(vo);
            if(n>0){
            	session.setAttribute("nickname", nickname);
            	return "redirect:/mypage/profile";
            }else{
            	return ".mypage.fail";
            }
            
		}catch(IOException ie){
			 ie.printStackTrace();
			 return ".mypage.fail";
		}
	}
	//비밀번호 찾기 기능
	@RequestMapping(value="/users/findPwd",method=RequestMethod.GET)
	public void findPwd(HttpServletResponse resp,String email)throws Exception{
		us.findPwd(email, resp);
	}
	//회원가입시 이메일 인증
	@RequestMapping(value="/users/verify",method=RequestMethod.GET)
	public void verify(HttpServletResponse resp,String email,HttpSession session)throws Exception{
		us.verify(email, resp,session);		

	}
	@RequestMapping(value="/users/chkcode",method=RequestMethod.GET)
	@ResponseBody
	public String chkcode(HttpSession session)throws Exception{	

		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		sb.append("<code>" + (String)session.getAttribute("code") + "</code>");
		sb.append("</result>");
		return sb.toString();
	}
}
