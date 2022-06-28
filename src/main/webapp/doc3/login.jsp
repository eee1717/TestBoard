<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title> JSP 게시판 로그인페이지</title>
</head>
<body>


<%
   String userID = null;
   if(session.getAttribute("userID") != null){
	   userID =(String) session.getAttribute("userID");
   }
%>




<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="main.jsp">메인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BBS.jsp">게시판</a>
        </li>
        
       		 <%
  			if(userID ==null){
			%> 
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 회원관리 </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="login.jsp">로그인</a></li>    
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="Join.jsp">회원가입</a></li>
          </ul>
        </li>
        
        <%
 			
  			} else{
	  
		%>	  
		 <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 회원관리 </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
             <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
        
          
          </ul>
        </li>
		
	
		
		
		
		
        
        <%	  
		  }
		%>
        
  
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">몰라</a>
        </li>
      </ul>
  
    </div>
  </div>
</nav>








<div class="container">
<div class="col-lg-4"></div>

<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post" action="loginAction.jsp">
<h3 style="text-align: center;">로그인화면</h3>
<div class="form-group">
<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
</div>
<div class="form-group">
<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
</div>
<input type="submit" class="btn btn-primary form-control" value="로그인">
</form>
</div>
<div class="col-lg-4"></div>
</div>
</div>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>