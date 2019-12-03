package project.app.dadaum.vo;

public class MylistVo {
	private int mylistnum;
	private int contnum;
	private int usernum;
	private int alaram;
	public MylistVo(){}
	public MylistVo(int mylistnum, int contnum, int usernum, int alaram) {
		this.mylistnum = mylistnum;
		this.contnum = contnum;
		this.usernum = usernum;
		this.alaram = alaram;
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
	public MylistVo(int alaram) {
		super();
		this.alaram = alaram;
	}
}
