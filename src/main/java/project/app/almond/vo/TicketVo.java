package project.app.almond.vo;

public class TicketVo {
	private int tknum;
	private int contnum;
	private int cnt1;
	private int cnt2;
	private int cnt3;
	private int rentalprice1;
	private int rentalprice2;
	private int rentalprice3;
	private int ownprice1;
	private int ownprice2;
	private int ownprice3;
	public TicketVo(){}
	public TicketVo(int tknum, int contnum, int cnt1, int cnt2, int cnt3, int rentalprice1, int rentalprice2, int rentalprice3, int ownprice1, int ownprice2, int ownprice3) {
		this.tknum = tknum;
		this.contnum = contnum;
		this.cnt1 = cnt1;
		this.cnt2 = cnt2;
		this.cnt3 = cnt3;
		this.rentalprice1 = rentalprice1;
		this.rentalprice2 = rentalprice2;
		this.rentalprice3 = rentalprice3;
		this.ownprice1 = ownprice1;
		this.ownprice2 = ownprice2;
		this.ownprice3 = ownprice3;
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
	public int getCnt1() {
		return cnt1;
	}
	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}
	public int getCnt2() {
		return cnt2;
	}
	public void setCnt2(int cnt2) {
		this.cnt2 = cnt2;
	}
	public int getCnt3() {
		return cnt3;
	}
	public void setCnt3(int cnt3) {
		this.cnt3 = cnt3;
	}
	public int getRentalprice1() {
		return rentalprice1;
	}
	public void setRentalprice1(int rentalprice1) {
		this.rentalprice1 = rentalprice1;
	}
	public int getRentalprice2() {
		return rentalprice2;
	}
	public void setRentalprice2(int rentalprice2) {
		this.rentalprice2 = rentalprice2;
	}
	public int getRentalprice3() {
		return rentalprice3;
	}
	public void setRentalprice3(int rentalprice3) {
		this.rentalprice3 = rentalprice3;
	}
	public int getOwnprice1() {
		return ownprice1;
	}
	public void setOwnprice1(int ownprice1) {
		this.ownprice1 = ownprice1;
	}
	public int getOwnprice2() {
		return ownprice2;
	}
	public void setOwnprice2(int ownprice2) {
		this.ownprice2 = ownprice2;
	}
	public int getOwnprice3() {
		return ownprice3;
	}
	public void setOwnprice3(int ownprice3) {
		this.ownprice3 = ownprice3;
	}
}
