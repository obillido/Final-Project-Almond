package project.app.almond.vo;

public class Commlikes {
	private int likenum;
	private int usernum;
	private int commnum;
	private int type;
	public Commlikes(){}
	public Commlikes(int likenum, int usernum, int commnum, int type) {
		this.likenum = likenum;
		this.usernum = usernum;
		this.commnum = commnum;
		this.type = type;
	}
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getCommnum() {
		return commnum;
	}
	public void setCommnum(int commnum) {
		this.commnum = commnum;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
