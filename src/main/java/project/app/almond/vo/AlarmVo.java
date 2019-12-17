package project.app.almond.vo;

import java.sql.Date;

public class AlarmVo {
	private int alarmnum;
	private int usernum;
	private String title;
	private String content;
	private Date regdate;
	private int status;
	private int num;
	public AlarmVo(){}
	public AlarmVo(int alarmnum, int usernum, String title, String content, Date regdate, int status, int num) {
		this.alarmnum = alarmnum;
		this.usernum = usernum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.status = status;
		this.num = num;
	}
	public int getAlarmnum() {
		return alarmnum;
	}
	public void setAlarmnum(int alarmnum) {
		this.alarmnum = alarmnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
