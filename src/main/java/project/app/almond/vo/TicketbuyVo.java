package project.app.almond.vo;

import java.sql.Date;

public class TicketbuyVo {
	private int tkbnum;
	private int tknum;
	private int usernum;
	/**
	 * 1 : 소장권
	 * 2 : 대여권
	 */
	private int usetype;
	private String method;
	private Date regdate;
	public TicketbuyVo(){}
	public TicketbuyVo(int tkbnum, int tknum, int usernum, int usetype, String method, Date regdate) {
		this.tkbnum = tkbnum;
		this.tknum = tknum;
		this.usernum = usernum;
		this.usetype = usetype;
		this.method = method;
		this.regdate = regdate;
	}
	public int getTkbnum() {
		return tkbnum;
	}
	public void setTkbnum(int tkbnum) {
		this.tkbnum = tkbnum;
	}
	public int getTknum() {
		return tknum;
	}
	public void setTknum(int tknum) {
		this.tknum = tknum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getUsetype() {
		return usetype;
	}
	public void setUsetype(int usetype) {
		this.usetype = usetype;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
