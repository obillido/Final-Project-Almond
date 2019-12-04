package project.app.almond.vo;

import java.sql.Date;

public class EventRouletteVo {
	private int eventnum;
	private int contnum;
	private String title;
	private String content;
	private Date regdate;
	private int headcount;
	private int price1;
	private int price2;
	private int price3;
	private int usebydate;
	public EventRouletteVo(){}
	public EventRouletteVo(int eventnum, int contnum, String title, String content, Date regdate, int headcount, int price1, int price2, int price3, int usebydate) {
		this.eventnum = eventnum;
		this.contnum = contnum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.headcount = headcount;
		this.price1 = price1;
		this.price2 = price2;
		this.price3 = price3;
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
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public int getPrice1() {
		return price1;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public int getPrice3() {
		return price3;
	}
	public void setPrice3(int price3) {
		this.price3 = price3;
	}
	public int getUsebydate() {
		return usebydate;
	}
	public void setUsebydate(int usebydate) {
		this.usebydate = usebydate;
	}
}
