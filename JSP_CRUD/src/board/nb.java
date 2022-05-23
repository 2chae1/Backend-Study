package board;

public class nb {
	private int BID; //글 아이디
	private String BTitle; //글 제목
	private String userID; //작성자 아이디
	private String BContent; //글 내용
	private int BAvailable;
	
	public int getBID() {
		return BID;
	}
	public String getBTitle() {
		return BTitle;
	}
	public String getUserID() {
		return userID;
	}
	public String getBContent() {
		return BContent;
	}
	public int getBAvailable() {
		return BAvailable;
	}
	
	public void setBID(int BID) {
		this.BID = BID;
	}
	public void setBTitle(String BTitle) {
		this.BTitle = BTitle; 
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public void setBContent(String BContent) {
		this.BContent = BContent;
	}
	public void setBAvailable(int BAvailable) {
		this.BAvailable = BAvailable;
	}
}
