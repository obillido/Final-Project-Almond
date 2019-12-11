package project.app.almond.vo;

import java.sql.Date;

public class EpisodeReadingVo {
	private int epinum;
	private int contnum;
	private Date uploaddate;
	private int hit;
	private String thumbnail;
	private String subtitle;
	private String img;
	private String content;
	private int epnum;
	private int readingnum;
	private int usernum;
	private Date readingdate;
	private int rt;
	private int type;
	public EpisodeReadingVo(){}
	public EpisodeReadingVo(int epinum, int contnum, Date uploaddate, int hit, String thumbnail, String subtitle,
			String img, String content, int epnum, int readingnum, int usernum, Date readingdate, int rt, int type) {
		this.epinum = epinum;
		this.contnum = contnum;
		this.uploaddate = uploaddate;
		this.hit = hit;
		this.thumbnail = thumbnail;
		this.subtitle = subtitle;
		this.img = img;
		this.content = content;
		this.epnum = epnum;
		this.readingnum = readingnum;
		this.usernum = usernum;
		this.readingdate = readingdate;
		this.rt = rt;
		this.type = type;
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
	public void setSubtitle(String subtitle) {
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
	public int getReadingnum() {
		return readingnum;
	}
	public void setReadingnum(int readingnum) {
		this.readingnum = readingnum;
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
	public int getRt() {
		return rt;
	}
	public void setRt(int rt) {
		this.rt = rt;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
