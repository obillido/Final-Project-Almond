package project.app.almond.vo;

import java.sql.Date;

public class EventVo {
	private int eventnum;
	private int contnum;
	private String title;
	private String content;
	private Date regdate;
	private Date startdate;
	private Date enddate;
	private String img;
	/*
	-- »óÅÂ : 10 : ¿­¶÷ -> ÃßÃ·
	-- 11 : ¿­¶÷ -> ·ê·¿
	-- 
	-- 20 : ¸®ºä -> ÃßÃ·
	-- 21 : ¸®ºä -> ·ê·¿
	-- 
	-- 31 : ·ê·¿ -> 1000
	-- 32 : ·ê·¿ -> 3000
	-- 33 : ·ê·¿ -> 5000
	-- 
	-- 40 : Å°¿öµå
	 */
	private int status;
	/*
	-- »ç¿ë±âÇÑ : 0 : »ç¿ë±âÇÑ ¾øÀ½
	-- 1 : 1½Ã°£
	-- 24 : ÇÏ·ç
	-- 48 : 2ÀÏ
	 */
	private int userbydate;
	private String keyword;
	private int price;
	public EventVo(){}
	public EventVo(int eventnum, int contnum, String title, String content, Date regdate, Date startdate, Date enddate,
			String img, int status, int userbydate, String keyword, int price) {
		this.eventnum = eventnum;
		this.contnum = contnum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.img = img;
		this.status = status;
		this.userbydate = userbydate;
		this.keyword = keyword;
		this.price = price;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getUserbydate() {
		return userbydate;
	}
	public void setUserbydate(int userbydate) {
		this.userbydate = userbydate;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
