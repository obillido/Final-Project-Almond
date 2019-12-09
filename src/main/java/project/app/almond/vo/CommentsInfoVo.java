package project.app.almond.vo;

import java.sql.Date;

public class CommentsInfoVo {
	private int commnum;
	private int epinum;
	private int usernum;
	private String content;
	private int ref;
	private int lev;
	private int step;
	private Date regdate;
	private String nickname;
	private String profileimg;
	private int cntlike;
	private int cnthate;
	private int mytype;
	public CommentsInfoVo(){}
	public CommentsInfoVo(int commnum, int epinum, int usernum, String content, int ref, int lev, int step,
			Date regdate, String nickname, String profileimg, int cntlike, int cnthate, int mytype) {
		this.commnum = commnum;
		this.epinum = epinum;
		this.usernum = usernum;
		this.content = content;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
		this.regdate = regdate;
		this.nickname = nickname;
		this.profileimg = profileimg;
		this.cntlike = cntlike;
		this.cnthate = cnthate;
		this.mytype = mytype;
	}
	public int getCommnum() {
		return commnum;
	}
	public void setCommnum(int commnum) {
		this.commnum = commnum;
	}
	public int getEpinum() {
		return epinum;
	}
	public void setEpinum(int epinum) {
		this.epinum = epinum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
	public int getCntlike() {
		return cntlike;
	}
	public void setCntlike(int cntlike) {
		this.cntlike = cntlike;
	}
	public int getCnthate() {
		return cnthate;
	}
	public void setCnthate(int cnthate) {
		this.cnthate = cnthate;
	}
	public int getMytype() {
		return mytype;
	}
	public void setMytype(int mytype) {
		this.mytype = mytype;
	}
}
