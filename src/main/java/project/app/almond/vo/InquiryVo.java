package project.app.almond.vo;

public class InquiryVo {
	private int inqnum;
	private int usernum;
	private String title;
	private String content;
	/**
	 * 0 : 대기
	 * 1 : 완료
	 */
	private int status;
	private int ref;
	private int lev;
	private int step;
	public InquiryVo(){}
	public InquiryVo(int inqnum, int usernum, String title, String content, int status, int ref, int lev, int step) {
		this.inqnum = inqnum;
		this.usernum = usernum;
		this.title = title;
		this.content = content;
		this.status = status;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
	}
	public int getInqnum() {
		return inqnum;
	}
	public void setInqnum(int inqnum) {
		this.inqnum = inqnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
}
