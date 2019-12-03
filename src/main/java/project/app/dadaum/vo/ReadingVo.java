package project.app.dadaum.vo;

import java.sql.Date;

public class ReadingVo {
	private int readingnum;
	private int epinum;
	private int usernum;
	private Date readingdate;
	public ReadingVo(){}
	public ReadingVo(int readingnum, int epinum, int usernum, Date readingdate) {
		this.readingnum = readingnum;
		this.epinum = epinum;
		this.usernum = usernum;
		this.readingdate = readingdate;
	}
	public int getReadingnum() {
		return readingnum;
	}
	public void setReadingnum(int readingnum) {
		this.readingnum = readingnum;
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
	public Date getReadingdate() {
		return readingdate;
	}
	public void setReadingdate(Date readingdate) {
		this.readingdate = readingdate;
	}
}
