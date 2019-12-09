package project.app.almond.vo;

import java.sql.Date;

public class CashVo {
	private int cashnum;
	private int usernum;
	private int price;
	private Date regdate;
	private String method;
	public CashVo(){}
	public CashVo(int cashnum, int usernum, int price, Date regdate, String method) {
		this.cashnum = cashnum;
		this.usernum = usernum;
		this.price = price;
		this.regdate = regdate;
		this.method = method;
	}
	public int getCashnum() {
		return cashnum;
	}
	public void setCashhnum(int cashnum) {
		this.cashnum = cashnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
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
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
}
