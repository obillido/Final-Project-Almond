package project.app.almond.dao;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.app.almond.vo.UsersVo;

@Repository
public class UsersDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="project.mybatis.mapper.UsersMapper";
	public int updateCashSub(UsersVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".updateCashSub", vo);
	}
	public UsersVo getInfo(int usernum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getInfo",usernum);
	}
	public int insert(UsersVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insert",vo);
	}
	public UsersVo login(UsersVo vo) {
		return sqlSessionTemplate.selectOne("project.mybatis.mapper.UsersMapper.login",vo);
	}
	public UsersVo emailcheck(String email) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".emailcheck",email);
	}
	public int chgProfile(UsersVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".chgProfile",vo);
	}
	public int updatePwd(UsersVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".updatePwd",vo);
	}
	public UsersVo existingEmail(String email){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".existingEmail",email);
	}

	//이메일 발송 메소드1
	public void sendEmail(UsersVo vo) {
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "shkim8618@naver.com";
		String hostSMTPpwd = "gogosh1105";

		//보내는 사람 Email, 제목, 내용
		String fromEmail = "shkim8618@naver.com";
		String fromName = "Almond Page";
		String subject = "";
		String msg = "";
	
		subject = "Almond Page 임시 비밀번호입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += vo.getEmail() + "님의 임시 비밀번호 입니다. 로그인 후 비밀번호를 재변경해 주세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += vo.getPwd() + "</p></div>";
		
		//받는 사람 Email 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email= new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	//이메일 발송 메소드2
	public void sendEmail2(String email,String code){
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "shkim8618@naver.com";
		String hostSMTPpwd = "gogosh1105";

		//보내는 사람 Email, 제목, 내용
		String fromEmail = "shkim8618@naver.com";
		String fromName = "Almond Page";
		String subject = "";
		String msg = "";
	
		subject = "Almond Page 인증번호입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += "회원가입을 위한 인증번호입니다. 회원가입 페이지에서 인증번호를 입력해 주세요.</h3>";
		msg += "<p>인증번호 : ";
		msg += code+ "</p></div>";
		
		//받는 사람 Email 주소
		String mail = email;
		try {
			HtmlEmail hemail= new HtmlEmail();
			hemail.setDebug(true);
			hemail.setCharset(charSet);
			hemail.setSSL(true);
			hemail.setHostName(hostSMTP);
			hemail.setSmtpPort(587);

			hemail.setAuthentication(hostSMTPid, hostSMTPpwd);
			hemail.setTLS(true);
			hemail.addTo(mail, charSet);
			hemail.setFrom(fromEmail, fromName, charSet);
			hemail.setSubject(subject);
			hemail.setHtmlMsg(msg);
			hemail.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
}
