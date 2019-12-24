package project.app.almond.vo;

import java.sql.Date;

public class AlarmVo {
	private int alarmnum;
	private int usernum;
	private String title;
	private String content;
	private Date regdate;
	private String showdate;
	private int type;
	private int num;
	private int status;
	public AlarmVo(){}
	public AlarmVo(int alarmnum, int usernum, String title, String content, Date regdate, String showdate, int type, int num, int status) {
		this.alarmnum = alarmnum;
		this.usernum = usernum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.showdate = showdate;
		this.type = type;
		this.num = num;
		this.status = status;
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
	public String getShowdate() {
		return showdate;
	}
	public void setShowdate(String showdate) {
		this.showdate = showdate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
