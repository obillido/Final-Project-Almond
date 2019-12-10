package project.app.almond.vo;

import java.sql.Date;

public class MylistVo {
	private int mylistnum;
	private int contnum;
	private int usernum;
	/**
	 * 0 : 알람해제
	 * 1 : 알람설정
	 */
	private int alaram;
	private Date readingdate;
	public MylistVo(){}
	public MylistVo(int mylistnum, int contnum, int usernum, int alaram, Date readingdate) {
		this.mylistnum = mylistnum;
		this.contnum = contnum;
		this.usernum = usernum;
		this.alaram = alaram;
		this.readingdate = readingdate;
	}
	public int getMylistnum() {
		return mylistnum;
	}
	public void setMylistnum(int mylistnum) {
		this.mylistnum = mylistnum;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getAlaram() {
		return alaram;
	}
	public void setAlaram(int alaram) {
		this.alaram = alaram;
	}
	public Date getReadingdate() {
		return readingdate;
	}
	public void setReadingdate(Date readingdate) {
		this.readingdate = readingdate;
	}
}
