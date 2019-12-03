package project.app.dadaum.vo;

public class BookVo {
	private int contnum;
	private String writer;
	private String illustrator;
	private String publisher;
	public BookVo(){}
	public BookVo(int contnum, String writer, String illustrator, String publisher) {
		this.contnum = contnum;
		this.writer = writer;
		this.illustrator = illustrator;
		this.publisher = publisher;
	}
	public int getContnum() {
		return contnum;
	}
	public void setContnum(int contnum) {
		this.contnum = contnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIllustrator() {
		return illustrator;
	}
	public void setIllustrator(String illustrator) {
		this.illustrator = illustrator;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
}