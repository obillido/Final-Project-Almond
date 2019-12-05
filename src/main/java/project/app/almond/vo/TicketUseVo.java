package project.app.almond.vo;

import java.sql.Date;

public class TicketUseVo {
	private int tkunum;
	private int usernum;
	private int epinum;
	private Date usedate;
	/**
	 * 1 : 소장권
	 * 2 : 대여권
	 */
	private int type;
	public TicketUseVo(){}
	public TicketUseVo(int tkunum, int usernum, int epinum, Date usedate, int type) {
		this.tkunum = tkunum;
		this.usernum = usernum;
		this.epinum = epinum;
		this.usedate = usedate;
		this.type = type;
	}
	public int getTkunum() {
		return tkunum;
	}
	public void setTkunum(int tkunum) {
		this.tkunum = tkunum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getEpinum() {
		return epinum;
	}
	public void setEpinum(int epinum) {
		this.epinum = epinum;
	}
	public Date getUsedate() {
		return usedate;
	}
	public void setUsedate(Date usedate) {
		this.usedate = usedate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
