package project.app.almond.vo;

public class TicketStock {
	private int tksnum;
	private int usernum;
	private int contnum;
	private int cnt;
	/**
	 * 1 : 소장권
	 * 2 : 대여권
	 */
	private int type;
	public TicketStock(){}
	public TicketStock(int tksnum, int usernum, int contnum, int cnt, int type) {
		this.tksnum = tksnum;
		this.usernum = usernum;
		this.contnum = contnum;
		this.cnt = cnt;
		this.type = type;
	}
	public int getTksnum() {
		return tksnum;
	}
	public void setTksnum(int tksnum) {
		this.tksnum = tksnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
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
}
