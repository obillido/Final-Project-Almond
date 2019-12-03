package project.app.almond.vo;

import java.sql.Date;

public class SearchVo {
	private int searchnum;
	private int usernum;
	private String searchword;
	private Date searchdate;
	public SearchVo(){}
	public SearchVo(int searchnum, int usernum, String searchword, Date searchdate) {
		this.searchnum = searchnum;
		this.usernum = usernum;
		this.searchword = searchword;
		this.searchdate = searchdate;
	}
	public int getSearchnum() {
		return searchnum;
	}
	public void setSearchnum(int searchnum) {
		this.searchnum = searchnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getSearchword() {
		return searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}
	public Date getSearchdate() {
		return searchdate;
	}
	public void setSearchdate(Date searchdate) {
		this.searchdate = searchdate;
	}
}
