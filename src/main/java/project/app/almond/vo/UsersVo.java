package project.app.almond.vo;

public class UsersVo {
	private int usernum;
	private String email;
	private String pwd;
	private String nickname;
	private String profileimg;
	private int cash;
	private int point;
	public UsersVo(){}
	public UsersVo(int usernum, String email, String pwd, String nickname, String profileimg, int cash, int point) {
		this.usernum = usernum;
		this.email = email;
		this.pwd = pwd;
		this.nickname = nickname;
		this.profileimg = profileimg;
		this.cash = cash;
		this.point = point;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
