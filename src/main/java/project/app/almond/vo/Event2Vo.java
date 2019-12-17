package project.app.almond.vo;

import java.sql.Date;

public class Event2Vo {
	private int usernum;
	private String nickname;
	private int eventnum;
	private int contnum;
	private int epinum;
	private Date readingdate;	
	private int name;
	public Event2Vo(){}
	public Event2Vo(int usernum, String nickname, int eventnum, int contnum, int epinum, Date readingdate, int name) {
		super();
		this.usernum = usernum;
		this.nickname = nickname;
		this.eventnum = eventnum;
		this.contnum = contnum;
		this.epinum = epinum;
		this.readingdate = readingdate;
		this.name = name;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getEventnum() {
		return eventnum;
	}
	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public int getEpinum() {
		return epinum;
	}
	public void setEpinum(int epinum) {
		this.epinum = epinum;
	}
	public Date getReadingdate() {
		return readingdate;
	}
	public void setReadingdate(Date readingdate) {
		this.readingdate = readingdate;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	
}
