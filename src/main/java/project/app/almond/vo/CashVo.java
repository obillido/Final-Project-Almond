package project.app.almond.vo;

import java.sql.Date;

public class CashVo {
	private int cashnum;
	private int usernum;
	private int price;
	private Date regdate;
	private int type;
	private String method;
	public CashVo(){}
	public CashVo(int cashnum, int usernum, int price, Date regdate, int type, String method) {
		this.cashnum = cashnum;
		this.usernum = usernum;
		this.price = price;
		this.regdate = regdate;
		this.type = type;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
}
