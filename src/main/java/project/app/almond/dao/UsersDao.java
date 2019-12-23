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

	//�̸��� �߼� �޼ҵ�1
	public void sendEmail(UsersVo vo) {
		//Mail Server ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "shkim8618@naver.com";
		String hostSMTPpwd = "gogosh1105";

		//������ ��� Email, ����, ����
		String fromEmail = "shkim8618@naver.com";
		String fromName = "Almond Page";
		String subject = "";
		String msg = "";
	
		subject = "Almond Page �ӽ� ��й�ȣ�Դϴ�.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += vo.getEmail() + "���� �ӽ� ��й�ȣ �Դϴ�. �α��� �� ��й�ȣ�� �纯���� �ּ���.</h3>";
		msg += "<p>�ӽ� ��й�ȣ : ";
		msg += vo.getPwd() + "</p></div>";
		
		//�޴� ��� Email �ּ�
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
			System.out.println("���Ϲ߼� ���� : " + e);
		}
	}
	
	//�̸��� �߼� �޼ҵ�2
	public void sendEmail2(String email,String code){
		//Mail Server ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "shkim8618@naver.com";
		String hostSMTPpwd = "gogosh1105";

		//������ ��� Email, ����, ����
		String fromEmail = "shkim8618@naver.com";
		String fromName = "Almond Page";
		String subject = "";
		String msg = "";
	
		subject = "Almond Page ������ȣ�Դϴ�.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += "ȸ�������� ���� ������ȣ�Դϴ�. ȸ������ ���������� ������ȣ�� �Է��� �ּ���.</h3>";
		msg += "<p>������ȣ : ";
		msg += code+ "</p></div>";
		
		//�޴� ��� Email �ּ�
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
			System.out.println("���Ϲ߼� ���� : " + e);
		}
	}
}
