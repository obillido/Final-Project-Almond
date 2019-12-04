package project.app.almond.vo;

public class UsersVo {
	private int usernum;
	private String email;
	private String pwd;
	private String phone;
	private String nickname;
	private String profileimg;
	private int cash;
	private int status;
	public UsersVo(){}
	public UsersVo(int usernum, String email, String pwd, String phone, String nickname, String profileimg, int cash, int status) {
		this.usernum = usernum;
		this.email = email;
		this.pwd = pwd;
		this.phone = phone;
		this.nickname = nickname;
		this.profileimg = profileimg;
		this.cash = cash;
		this.status = status;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
