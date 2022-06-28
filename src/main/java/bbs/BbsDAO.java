package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;
	
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
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
//	bbs아이디 가져오기
	public int getNext() {
		  String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
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
	
	 public int write(String bbsTitle, String userID, String bbsContent)  //글쓰기 
	 {	
		 String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  	 pstmt.setInt(1, getNext());
			  pstmt.setString(2, bbsTitle);
			  pstmt.setString(3, userID);
			  pstmt.setString(4, getDate());
			  pstmt.setString(5, bbsContent);
			  	 pstmt.setInt(6, 1); //처음글 일경우
			 
			  return pstmt.executeUpdate();		 
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  return -1; //데이터베이스오류
		 
	 }
	
	 public ArrayList<Bbs> getList(int pageNumber){
		 
		  String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 6"; // 내용을 위에서부터 6깨까지만 불러옴
		  ArrayList<Bbs> list = new ArrayList<Bbs>();
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, getNext() -(pageNumber -1) *10);		
			  rs = pstmt.executeQuery();
			  while(rs.next()) {
				  Bbs bbs = new Bbs();
				  bbs.setBbsID(rs.getInt(1));
				  bbs.setBbsTitle(rs.getString(2));
				  bbs.setUserID(rs.getString(3));
				  bbs.setBbsDate(rs.getString(4));
				  bbs.setBbsContent(rs.getString(5));
				  bbs.setBbsAvailable(rs.getInt(6));
				  list.add(bbs);
				
			  } 
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  return list;
		}
		 
	 public boolean nextPage(int pageNumber)  //페이징 처리를위해서 존재하는함수
	 {
		
		  String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10"; // 내용을 위에서부터 10깨까지만 불러옴
		  ArrayList<Bbs> list = new ArrayList<Bbs>();
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
		 
	 public Bbs getBbs(int bbsID) {
		 
		  String SQL = "SELECT * FROM BBS WHERE bbsID =?";  //bbsID의 값을 입력시 그숫자에 해당하는 게시글을 가져온다.
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, bbsID);	 
			  rs = pstmt.executeQuery();
			 if(rs.next()) {				  
				  Bbs bbs = new Bbs();
				  bbs.setBbsID(rs.getInt(1));
				  bbs.setBbsTitle(rs.getString(2));
				  bbs.setUserID(rs.getString(3));
				  bbs.setBbsDate(rs.getString(4));
				  bbs.setBbsContent(rs.getString(5));
				  bbs.setBbsAvailable(rs.getInt(6));
				  
				  return bbs;	  
			  } 
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  return null; //해당글이 존재하지않은경우 null을 반환
		 
		 
	 }
	 
		 
	 }
	

	

