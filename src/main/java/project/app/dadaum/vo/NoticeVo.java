package project.app.dadaum.vo;

import java.sql.Date;

public class NoticeVo {
	private int noticenum;
	private String title;
	private String content;
	private Date regdate;
	public NoticeVo(){}
	public NoticeVo(int noticenum, String title, String content, Date regdate) {
		this.noticenum = noticenum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public int getNoticenum() {
		return noticenum;
	}
	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
}
