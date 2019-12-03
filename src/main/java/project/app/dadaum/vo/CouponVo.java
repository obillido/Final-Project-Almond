package project.app.dadaum.vo;

import java.sql.Date;

public class CouponVo {
	private int coupnum;
	private String keyword;
	private Date regdate;
	private Date startdate;
	private Date enddate;
	private int price;
	private int usebydate;
	public CouponVo(){}
	public CouponVo(int coupnum, String keyword, Date regdate, Date startdate, Date enddate, int price, int usebydate) {
		this.coupnum = coupnum;
		this.keyword = keyword;
		this.regdate = regdate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.price = price;
		this.usebydate = usebydate;
	}
	public int getCoupnum() {
		return coupnum;
	}
	public void setCoupnum(int coupnum) {
		this.coupnum = coupnum;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
