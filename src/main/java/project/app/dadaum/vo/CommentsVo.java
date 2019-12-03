package project.app.dadaum.vo;

import java.sql.Date;

public class CommentsVo {
	private int commnum;
	private int epinum;
	private int username;
	private String content;
	private int ref;
	private int level;
	private int step;
	private Date regdate;
	public CommentsVo(){}
	public CommentsVo(int commnum, int epinum, int username, String content, int ref, int level, int step, Date regdate) {
		this.commnum = commnum;
		this.epinum = epinum;
		this.username = username;
		this.content = content;
		this.ref = ref;
		this.level = level;
		this.step = step;
		this.regdate = regdate;
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
	public int getUsername() {
		return username;
	}
	public void setUsername(int username) {
		this.username = username;
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
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
}
