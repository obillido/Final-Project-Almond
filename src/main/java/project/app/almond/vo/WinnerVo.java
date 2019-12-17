package project.app.almond.vo;

public class WinnerVo {
	private int winnum;
	private int eventnum;
	private int usernum;
	
	public WinnerVo(){}

	public WinnerVo(int winnum, int eventnum, int usernum) {
		super();
		this.winnum = winnum;
		this.eventnum = eventnum;
		this.usernum = usernum;
	}

	public int getWinnum() {
		return winnum;
	}

	public void setWinnum(int winnum) {
		this.winnum = winnum;
	}

	public int getEventnum() {
		return eventnum;
	}

	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}

	public int getUsernum() {
		return usernum;
	}

	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	
	
}
