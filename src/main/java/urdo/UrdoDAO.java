package urdo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UrdoDAO {

	private Connection conn;
	
	private ResultSet rs;
	
	public UrdoDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/URDO";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
//	현재시간 보여주기
	public String getDate() {
	  String SQL = "SELECT NOW()";
	  try {
		  PreparedStatement pstmt = conn.prepareStatement(SQL);
		  rs = pstmt.executeQuery();
		  if(rs.next()) {
			  return rs.getString(1);
		  }
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
	  return ""; //데이터베이스오류
	}
//	URDO아이디 가져오기
	public int getNext() {
		  String SQL = "SELECT urdoID FROM URDO ORDER BY urdoID DESC";
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  rs = pstmt.executeQuery();
			  if(rs.next()) {
				  return rs.getInt(1) +1;
			  }
			  return 1; //첫번째 게시물인경우 1   두번째부터는 return rs.getInt(1)+1을반환
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  return -1; //데이터베이스오류 일경우 -1을반환
		}
	
	 public int write(String urdoTitle,String lookup,String recommend, String userID, String urdoContent)  //글쓰기 
	 {	
		 String SQL = "INSERT INTO URDO VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  	 pstmt.setInt(1, getNext());
			  pstmt.setString(2, urdoTitle);
			  pstmt.setString(3, lookup);
			  pstmt.setString(4, recommend);
			  pstmt.setString(5, userID);
			  pstmt.setString(6, getDate());
			  pstmt.setString(7, urdoContent);
			  	 pstmt.setInt(8, 1); //처음글 일경우
			 
			  return pstmt.executeUpdate();		 
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  return -1; //데이터베이스오류
		 
	 }
	
	 public ArrayList<Urdo> getList(int pageNumber){
		 
		  String SQL = "SELECT * FROM TestBoard WHERE urdoID < ? AND urdoAvailable = 1 ORDER BY urdoID DESC LIMIT 6"; // 내용을 위에서부터 6깨까지만 불러옴
		  ArrayList<Urdo> list = new ArrayList<Urdo>();
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, getNext() -(pageNumber -1) *10);		
			  rs = pstmt.executeQuery();
			  while(rs.next()) {
				  Urdo urdo = new Urdo();
				  urdo.setUrdoID(rs.getInt(1));
				  urdo.setUrdoTitle(rs.getString(2));
				  urdo.setLookup(rs.getString(3));
				  urdo.setRecommend(rs.getString(4));
				  urdo.setUserID(rs.getString(5));
				  urdo.setUrdoDate(rs.getString(6));
				  urdo.setUrdoContent(rs.getString(7));
				  urdo.setUrdoAvailable(rs.getInt(8));
				  list.add(urdo);
				
			  } 
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  return list;
		}
		 
	 public boolean nextPage(int pageNumber)  //페이징 처리를위해서 존재하는함수
	 {
		
		  String SQL = "SELECT * FROM URDO WHERE urdoID < ? AND urdoAvailable = 1 ORDER BY urdoID DESC LIMIT 10"; // 내용을 위에서부터 10깨까지만 불러옴
		  ArrayList<Urdo> list = new ArrayList<Urdo>();
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, getNext() -(pageNumber -1) *10);	  //게시글이 11개가되면 2개가됨  21개가되면 3개(3페이지)가됨	
			  rs = pstmt.executeQuery();
			 if(rs.next()) {
				  
				return true;
			  } 
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  return false;
		}
		 
	 public Urdo getUrdo(int urdoID) {
		 
		  String SQL = "SELECT * FROM URDO WHERE urdoID =?";  //urdoID의 값을 입력시 그숫자에 해당하는 게시글을 가져온다.
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, urdoID);	 
			  rs = pstmt.executeQuery();
			 if(rs.next()) {				  
				  Urdo urdo = new Urdo();
				  urdo.setUrdoID(rs.getInt(1));
				  urdo.setUrdoTitle(rs.getString(2));
				  urdo.setLookup(rs.getString(3));
				  urdo.setRecommend(rs.getString(4));
				  urdo.setUserID(rs.getString(5));
				  urdo.setUrdoDate(rs.getString(6));
				  urdo.setUrdoContent(rs.getString(7));				 
				  urdo.setUrdoAvailable(rs.getInt(8));
				  
				  return urdo;	  
			  } 
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  return null; //해당글이 존재하지않은경우 null을 반환
		 
		 
	 }
	 
		 
	 }
	

	

