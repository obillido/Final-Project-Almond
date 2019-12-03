package project.app.dadaum.vo;

public class TicketVo {
	private int tknum;
	private int contnum;
	private int cnt;
	private int rentalprice;
	private int ownprice;
	public TicketVo(){}
	public TicketVo(int tknum, int contnum, int cnt, int rentalprice, int ownprice) {
		this.tknum = tknum;
		this.contnum = contnum;
		this.cnt = cnt;
		this.rentalprice = rentalprice;
		this.ownprice = ownprice;
	}
	public int getTknum() {
		return tknum;
	}
	public void setTknum(int tknum) {
		this.tknum = tknum;
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
	public int getRentalprice() {
		return rentalprice;
	}
	public void setRentalprice(int rentalprice) {
		this.rentalprice = rentalprice;
	}
	public int getOwnprice() {
		return ownprice;
	}
	public void setOwnprice(int ownprice) {
		this.ownprice = ownprice;
	}
}
