package project.app.dadaum.vo;

public class ScoreVo {
	private int scorenum;
	private int epinum;
	private int usernum;
	private int score;
	private int socre;
	public ScoreVo(){}
	public ScoreVo(int scorenum, int epinum, int usernum, int score, int socre) {
		this.scorenum = scorenum;
		this.epinum = epinum;
		this.usernum = usernum;
		this.score = score;
		this.socre = socre;
	}
	public int getScorenum() {
		return scorenum;
	}
	public void setScorenum(int scorenum) {
		this.scorenum = scorenum;
	}
	public int getEpinum() {
		return epinum;
	}
	public void setEpinum(int epinum) {
		this.epinum = epinum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getSocre() {
		return socre;
	}
	public void setSocre(int socre) {
		this.socre = socre;
	}
}
