package project.app.almond.vo;

import java.sql.Date;

public class GiftVo {
	private int giftnum;
	private int contnum;
	private int cnt;
	private int type;
	private Date startdate;
	private Date enddate;
	private Date regdate;
	public GiftVo(){}
	public GiftVo(int giftnum, int contnum, int cnt, int type, Date startdate, Date enddate, Date regdate) {
		this.giftnum = giftnum;
		this.contnum = contnum;
		this.cnt = cnt;
		this.type = type;
		this.startdate = startdate;
		this.enddate = enddate;
		this.regdate = regdate;
	}
	public int getGiftnum() {
		return giftnum;
	}
	public void setGiftnum(int giftnum) {
		this.giftnum = giftnum;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
