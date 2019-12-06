package project.app.almond.vo;

public class BookVo {
	private int contnum;
	private String writer;
	private String illustrator;
	private String publisher;
	private String dayofweek;
	public BookVo(){}
	public BookVo(int contnum, String writer, String illustrator, String publisher, String dayofweek) {
		this.contnum = contnum;
		this.writer = writer;
		this.illustrator = illustrator;
		this.publisher = publisher;
		this.dayofweek = dayofweek;
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
	public String getDayofweek() {
		return dayofweek;
	}
	public void setDayofweek(String dayofweek) {
		this.dayofweek = dayofweek;
	}
}