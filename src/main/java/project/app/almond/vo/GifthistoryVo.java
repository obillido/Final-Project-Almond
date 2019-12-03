package project.app.almond.vo;

import java.sql.Date;

public class GifthistoryVo {
	private int gifthnum;
	private int giftnum;
	private int usernum;
	private Date regdate;
	public GifthistoryVo(int gifthnum, int giftnum, int usernum, Date regdate) {
		this.gifthnum = gifthnum;
		this.giftnum = giftnum;
		this.usernum = usernum;
		this.regdate = regdate;
	}
	public GifthistoryVo(){}
	public int getGifthnum() {
		return gifthnum;
	}
	public void setGifthnum(int gifthnum) {
		this.gifthnum = gifthnum;
	}
	public int getGiftnum() {
		return giftnum;
	}
	public void setGiftnum(int giftnum) {
		this.giftnum = giftnum;
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
}
