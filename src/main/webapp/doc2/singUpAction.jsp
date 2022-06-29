<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="nickname"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> JSP 게시판 웹 사이트</title>
</head>
<body>



 <%
 
 String userID = null;
if(session.getAttribute("userID") !=null){
	 userID = (String) session.getAttribute("userID");
}
if(userID !=null){
	 PrintWriter script =response.getWriter();
	   script.println("<script>");
	   script.println("alert('이미 로그인이 되어있습니다.')");
	   script.println("location.href = 'login.jsp'");
	   script.println("</script>");
}   // session을 확인해서 이미 있는 아아디인지확인
 
 
 
  if(user.getUserID() == null || user.getUserPassword() == null  || user.getUserEmail() == null || user.getNickname() ==null )
  {
	 PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('입력되지않은사항이있습니다..')");
	   script.println("history.back()");
	   script.println("</script>");
  }else
  {
	  UserDAO userDAO = new UserDAO();
	   int result = userDAO.join(user);    
	   //회원가입 될시primary key 가적용되어서 1개뿐인 userid가된다 그렇기때문에 
	   //userid가 중복일시 -1이 뜨게되어 이미존재하는아이디로 뜨게된다.
	   if(result == -1) //이미존재하는아이디
	   {
		   PrintWriter script =response.getWriter();
		   script.println("<script>");
		   script.println("alert('이미존재하는아이디.')");
		   script.println("history.back()");
		   script.println("</script>");
		   
	   }else  //회원가입 성공 bord_nowBest.jsp로 이동
	   {
		   session.setAttribute("userID",user.getUserID());
		   PrintWriter script =response.getWriter();
		   script.println("<script>");
		   script.println("location.href = 'bord_nowBest.jsp' ");
		   script.println("</script>");
		   
	   }
  } // 입력한데이터  입력되지않은사항이있는지확인하는 if문
 
   
 %>

</body>
</html>