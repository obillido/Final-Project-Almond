package project.app.dadaum.vo;

public class InquiryVo {
	private int inqnum;
	private int usernum;
	private String title;
	private String content;
	private int status;
	private int ref;
	private int level;
	private int step;
	public InquiryVo(){}
	public InquiryVo(int inqnum, int usernum, String title, String content, int status, int ref, int level, int step) {
		this.inqnum = inqnum;
		this.usernum = usernum;
		this.title = title;
		this.content = content;
		this.status = status;
		this.ref = ref;
		this.level = level;
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
}
