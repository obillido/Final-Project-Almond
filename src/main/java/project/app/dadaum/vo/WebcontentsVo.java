package project.app.dadaum.vo;

public class WebcontentsVo {
	private int contnum;
	private int cultype;
	private String genre;
	private String outline;
	private int price;
	private int waiting;
	private String img;
	private int completiontype;
	private int agegrade;
	private int freenum;
	public WebcontentsVo(){}
	public WebcontentsVo(int contnum, int cultype, String genre, String outline, int price, int waiting, String img, int completiontype, int agegrade, int freenum) {
		this.contnum = contnum;
		this.cultype = cultype;
		this.genre = genre;
		this.outline = outline;
		this.price = price;
		this.waiting = waiting;
		this.img = img;
		this.completiontype = completiontype;
		this.agegrade = agegrade;
		this.freenum = freenum;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
}
