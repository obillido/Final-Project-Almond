package project.app.almond.vo;

public class WebcontentsVo {
	private int contnum;
	private String title;
	private int cultype;
	private String genre;
	private String outline;
	private int tknum;
	private int waiting;
	private String img;
	private int completiontype;
	private int agegrade;
	private int freenum;
	private int status;
	private int readernum;
	public WebcontentsVo(){}
	public WebcontentsVo(int contnum, String title, int cultype, String genre, String outline, int tknum, int waiting,
			String img, int completiontype, int agegrade, int freenum, int status, int readernum) {
		this.contnum = contnum;
		this.title = title;
		this.cultype = cultype;
		this.genre = genre;
		this.outline = outline;
		this.tknum = tknum;
		this.waiting = waiting;
		this.img = img;
		this.completiontype = completiontype;
		this.agegrade = agegrade;
		this.freenum = freenum;
		this.status = status;
		this.readernum = readernum;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCultype() {
		return cultype;
	}
	public void setCultype(int cultype) {
		this.cultype = cultype;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getOutline() {
		return outline;
	}
	public void setOutline(String outline) {
		this.outline = outline;
	}
	public int getTknum() {
		return tknum;
	}
	public void setTknum(int tknum) {
		this.tknum = tknum;
	}
	public int getWaiting() {
		return waiting;
	}
	public void setWaiting(int waiting) {
		this.waiting = waiting;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getCompletiontype() {
		return completiontype;
	}
	public void setCompletiontype(int completiontype) {
		this.completiontype = completiontype;
	}
	public int getAgegrade() {
		return agegrade;
	}
	public void setAgegrade(int agegrade) {
		this.agegrade = agegrade;
	}
	public int getFreenum() {
		return freenum;
	}
	public void setFreenum(int freenum) {
		this.freenum = freenum;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getReadernum() {
		return readernum;
	}
	public void setReadernum(int readernum) {
		this.readernum = readernum;
	}
}
