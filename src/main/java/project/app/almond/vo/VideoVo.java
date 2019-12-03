package project.app.almond.vo;

import java.sql.Date;

public class VideoVo {
	private int contnum;
	private String director;
	private String actor;
	private int runtime;
	private Date proddate;
	public VideoVo(){}
	public VideoVo(int contnum, String director, String actor, int runtime, Date proddate) {
		this.contnum = contnum;
		this.director = director;
		this.actor = actor;
		this.runtime = runtime;
		this.proddate = proddate;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public Date getProddate() {
		return proddate;
	}
	public void setProddate(Date proddate) {
		this.proddate = proddate;
	}
}
