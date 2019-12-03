package project.app.almond.vo;

import java.sql.Date;

public class CouponhistoryVo {
	private int couphnum;
	private int coupnum;
	private int usernum;
	private Date regdate;
	private int price;
	public CouponhistoryVo(){}
	public CouponhistoryVo(int couphnum, int coupnum, int usernum, Date regdate, int price) {
		this.couphnum = couphnum;
		this.coupnum = coupnum;
		this.usernum = usernum;
		this.regdate = regdate;
		this.price = price;
	}
	public int getCouphnum() {
		return couphnum;
	}
	public void setCouphnum(int couphnum) {
		this.couphnum = couphnum;
	}
	public int getCoupnum() {
		return coupnum;
	}
	public void setCoupnum(int coupnum) {
		this.coupnum = coupnum;
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
}
