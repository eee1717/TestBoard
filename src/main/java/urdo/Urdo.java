package urdo;

public class Urdo {

	private int urdoID;  
    private String urdoTitle; //글제목
    private String lookup;    //조회
    private String recommend; //추천수
    private String userID; 
	private String urdoDate;  //작성일
	private String urdoContent;
	private int urdoAvailable;
	
	public int getUrdoID() {
		return urdoID;
	}
	public void setUrdoID(int urdoID) {
		this.urdoID = urdoID;
	}
	public String getUrdoTitle() {
		return urdoTitle;
	}
	public void setUrdoTitle(String urdoTitle) {
		this.urdoTitle = urdoTitle;
	}
	public String getLookup() {
		return lookup;
	}
	public void setLookup(String lookup) {
		this.lookup = lookup;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUrdoDate() {
		return urdoDate;
	}
	public void setUrdoDate(String urdoDate) {
		this.urdoDate = urdoDate;
	}
	public String getUrdoContent() {
		return urdoContent;
	}
	public void setUrdoContent(String urdoContent) {
		this.urdoContent = urdoContent;
	}
	public int getUrdoAvailable() {
		return urdoAvailable;
	}
	public void setUrdoAvailable(int urdoAvailable) {
		this.urdoAvailable = urdoAvailable;
	}

	@Override
	public String toString() {
		return "Urdo [urdoID=" + urdoID + ", urdoTitle=" + urdoTitle + ", lookup=" + lookup + ", recommend=" + recommend
				+ ", userID=" + userID + ", urdoDate=" + urdoDate + ", urdoContent=" + urdoContent + ", urdoAvailable="
				+ urdoAvailable + "]";
	}
	
	
	
	

	
	
	

	
}
