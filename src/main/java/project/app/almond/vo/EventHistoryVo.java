package project.app.almond.vo;

import java.sql.Date;

public class EventHistoryVo {
	private int eventhnum;
	private int eventnum;
	private int usernum;
	private Date regdate;
	private int price;
	/**
	 * 1 : Æ÷ÀÎÆ®
	 * 2 : type
	 */
	private int type;
	public EventHistoryVo(){}
	public EventHistoryVo(int eventhnum, int eventnum, int usernum, Date regdate, int price, int type) {
		this.eventhnum = eventhnum;
		this.eventnum = eventnum;
		this.usernum = usernum;
		this.regdate = regdate;
		this.price = price;
		this.type = type;
	}
	public int getEventhnum() {
		return eventhnum;
	}
	public void setEventhnum(int eventhnum) {
		this.eventhnum = eventhnum;
	}
	public int getEventnum() {
		return eventnum;
	}
	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
