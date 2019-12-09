package project.app.almond.vo;

import java.sql.Date;

public class ReadingEpisodeVo {
	private int readingnum;	
	private int epinum;
	private int usernum;
	private Date readingdate;
	private int contnum;	
	private int epnum;
	public ReadingEpisodeVo(){}
	public ReadingEpisodeVo(int readingnum, int epinum, int usernum, Date readingdate, int contnum, int epnum) {
		super();
		this.readingnum = readingnum;
		this.epinum = epinum;
		this.usernum = usernum;
		this.readingdate = readingdate;
		this.contnum = contnum;
		this.epnum = epnum;
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
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public int getEpnum() {
		return epnum;
	}
	public void setEpnum(int epnum) {
		this.epnum = epnum;
	}
}
