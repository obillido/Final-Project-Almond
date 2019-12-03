package project.app.dadaum.vo;

import java.sql.Date;

public class CashhistoryVo {
	private int cashhnum;
	private int usernum;
	private int price;
	private Date regdate;
	private int type;
	private String method;
	public CashhistoryVo(){}
	public CashhistoryVo(int cashhnum, int usernum, int price, Date regdate, int type, String method) {
		this.cashhnum = cashhnum;
		this.usernum = usernum;
		this.price = price;
		this.regdate = regdate;
		this.type = type;
		this.method = method;
	}
	public int getCashhnum() {
		return cashhnum;
	}
	public void setCashhnum(int cashhnum) {
		this.cashhnum = cashhnum;
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
