package project.app.almond.vo;

import java.sql.Date;

public class EventPointVo {
	private int eventnum;
	private int contnum;
	private String title;
	private String content;
	private Date regdate;
	private Date startdate;
	private Date enddate;
	private int price;
	private int usebydate;
	public EventPointVo(){}
	public EventPointVo(int eventnum, int contnum, String title, String content, Date regdate, Date startdate, Date enddate, int price, int usebydate) {
		this.eventnum = eventnum;
		this.contnum = contnum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.price = price;
		this.usebydate = usebydate;
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
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUsebydate() {
		return usebydate;
	}
	public void setUsebydate(int usebydate) {
		this.usebydate = usebydate;
	}
}
