package project.app.almond.vo;

import java.sql.Date;

public class EpisodeVo {
	private int epinum;
	private int contnum;
	private Date uploaddate;
	private int hit;
	private String thumbnail;
	private String subtitle;
	private String img;
	private String content;
	private int epnum;
	public EpisodeVo(){}
	public EpisodeVo(int epinum, int contnum, Date uploaddate, int hit, String thumbnail, String subtitle, String img,
			String content, int epnum) {
		this.epinum = epinum;
		this.contnum = contnum;
		this.uploaddate = uploaddate;
		this.hit = hit;
		this.thumbnail = thumbnail;
		this.subtitle = subtitle;
		this.img = img;
		this.content = content;
		this.epnum = epnum;
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtilte(String subtitle) {
		this.subtitle = subtitle;
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
	public int getEpnum() {
		return epnum;
	}
	public void setEpnum(int epnum) {
		this.epnum = epnum;
	}
}
