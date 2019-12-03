package project.app.almond.vo;

public class GiftVo {
	private int giftnum;
	private int contnum;
	private int cnt;
	private int usertype;
	public GiftVo(){}
	public GiftVo(int giftnum, int contnum, int cnt, int usertype) {
		this.giftnum = giftnum;
		this.contnum = contnum;
		this.cnt = cnt;
		this.usertype = usertype;
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
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
}
