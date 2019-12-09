package project.app.almond.vo;

import java.sql.Date;

public class CommentsEpisodeVo {
	private int epinum;
	private int usernum;
	private String content;
	private Date regdate;
	private int contnum;
	private int epnum;
	public CommentsEpisodeVo(){}
	public CommentsEpisodeVo(int epinum, int usernum, String content, Date regdate, int contnum, int epnum) {
		super();
		this.epinum = epinum;
		this.usernum = usernum;
		this.content = content;
		this.regdate = regdate;
		this.contnum = contnum;
		this.epnum = epnum;
	}
	public int getEpinum() {
		return epinum;
	}
	public void setEpinum(int epinum) {
		this.epinum = epinum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public int getEpnum() {
		return epnum;
	}
	public void setEpnum(int epnum) {
		this.epnum = epnum;
	}	
}
