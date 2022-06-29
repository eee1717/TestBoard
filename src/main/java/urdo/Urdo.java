package bbs;

public class Urdo {

	private int urdoID;
	private String urdoTitle;
	private String userID;
	private String urdoDate;
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
		return "Bbs [urdoID=" + urdoID + ", urdoTitle=" + urdoTitle + ", userID=" + userID + ", urdoDate=" + urdoDate
				+ ", urdoContent=" + urdoContent + ", urdoAvailable=" + urdoAvailable + "]";
	}
	
	
	
	
	
	

	
}
