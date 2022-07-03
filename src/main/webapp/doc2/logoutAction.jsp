<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> JSP 게시판 웹 사이트</title>
</head>
<body>



 <%
   
 session.invalidate(); //session을 빼앗아서 로그아웃시키는것
 

 %>
<script>
 location.href ='index.jsp';
</script>
</body>
</html>