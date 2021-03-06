package project.app.almond.vo;

import java.sql.Date;

public class ReadingVo {
	private int readingnum;
	private int epinum;
	private int usernum;
	private Date readingdate;
	private int type;
	public ReadingVo(){}
	public ReadingVo(int readingnum, int epinum, int usernum, Date readingdate, int type) {
		this.readingnum = readingnum;
		this.epinum = epinum;
		this.usernum = usernum;
		this.readingdate = readingdate;
		this.type = type;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
