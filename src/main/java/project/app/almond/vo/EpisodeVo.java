package project.app.almond.vo;

import java.sql.Date;

public class EpisodeVo {
	private int epinum;
	private int contnum;
	private Date uploaddate;
	private int hit;
	private String img;
	private String content;
	public EpisodeVo(){}
	public EpisodeVo(int epinum, int contnum, Date uploaddate, int hit, String img, String content) {
		this.epinum = epinum;
		this.contnum = contnum;
		this.uploaddate = uploaddate;
		this.hit = hit;
		this.img = img;
		this.content = content;
	}
	public int getEpinum() {
		return epinum;
	}
	public void setEpinum(int epinum) {
		this.epinum = epinum;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public Date getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
