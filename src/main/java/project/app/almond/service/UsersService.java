package project.app.almond.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.app.almond.dao.UsersDao;
import project.app.almond.vo.UsersVo;

@Service
public class UsersService {
	@Autowired private UsersDao udao;
	public UsersVo getInfo(int usernum){
		return udao.getInfo(usernum);
	}
	public int insert(UsersVo vo) {
		return udao.insert(vo);
	}
	public UsersService(UsersDao dao) {
		this.udao = dao;
	}
	public UsersVo login(UsersVo vo){
		return udao.login(vo);
	}
	public UsersVo emailcheck(String email) {
		return udao.emailcheck(email);
	}
	public int chgProfile(UsersVo vo){
		return udao.chgProfile(vo);
	}
	public void findPwd(String email,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		UsersVo vo=udao.existingEmail(email);
	
		//가입에 사용한 이메일이 아니면
		if(vo==null){
			pw.print("가입된 이메일이 아닙니다.");
			pw.close();
		}else{
			//임시 비밀번호 생성
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
			
			vo.setPwd(pwd);
			
			//비밀번호 변경
			udao.updatePwd(vo);
			
			//비밀번호 변경 메일 발송
			udao.sendEmail(vo);
		    pw.print("이메일로 임시 비밀번호를 발송하였습니다.");
			pw.close();
		}
	}
	public void verify(String email,HttpServletResponse resp,HttpSession session) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		String code="";
		for (int i = 0; i < 12; i++) {
			code += (char) ((Math.random() * 26) + 97);
		}
		
		udao.sendEmail2(email, code);
		pw.print("이메일로 인증번호를 발송하였습니다.");
		pw.close();
		session.setAttribute("code", code);
	}
}
