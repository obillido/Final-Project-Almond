package project.app.almond.vo;

import java.sql.Date;

public class TicketbuyVo {
	private int tkbnum;
	private int tknum;
	private int usernum;
	private int type;
	private int cnt;
	private int price;
	private Date regdate;
	public TicketbuyVo(){}
	public TicketbuyVo(int tkbnum, int tknum, int usernum, int type, int cnt, int price, Date regdate) {
		this.tkbnum = tkbnum;
		this.tknum = tknum;
		this.usernum = usernum;
		this.type = type;
		this.cnt = cnt;
		this.price = price;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
