<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <%@page import ="java.io.PrintWriter" %>
    <%@page import ="urdo.UrdoDAO" %>
    <%@page import ="urdo.Urdo" %>
    <%@page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>URDO</title>
    <link href="../img/sidebar/logo.svg" rel="shortcut icon" type="image/png">
    <!--CSS 링크-->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/board_write.css">
    <link rel="stylesheet" href="../css/pointShop.css">
    <!-- JQ -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <script>
        $(document).ready(function()
        {
            let span = document.querySelectorAll('.depth1 span');
            $('#check2').prop('checked', true);
            span[2].innerHTML = '&#65293';
            span[3].style.color = getColor('--color-point');
            span[3].style.fontWeight = 'bold';
            $('#active').css('color', getColor('--color-active')).css('font-weight', 'bold');
        })
    </script>
<body>

<%
   String userID = null;
   if(session.getAttribute("userID") != null){
	   userID =(String) session.getAttribute("userID");
   }
  int urdoID2 = 0; 
   if(request.getParameter("urdoID") != null){
	   urdoID2 = Integer.parseInt(request.getParameter("urdoID"));
   } 
   // 지금 urdoID2의 값에 urdoID를 request해서 넣어야는데안들어가는것으로 예상중
   //request.getParameter로넘어온 urdoID라는매개변수가 null이 아니라면 urdoID에
  //위의 변수 urdoID의 값에 request한ID값을 넣는다.

 /*    if(urdoID2 ==0){
	   PrintWriter script =response.getWriter();
	   script.println("<script>");
	   script.println("alert(' 유효하지않은 글입니다..(urdoID2가 0입니다)')");
	   script.println("location.href = 'bord_nowBest.jsp'");
	   script.println("</script>");
   }  //urdoID의 번호가 존재해야지 글목록을 볼수있게한다.
   Urdo urdo = new UrdoDAO().getUrdo(urdoID2);  */
%>





<!--네비게이션 시작-->
<nav class="nav-all">
    <!--헤더 시작-->
    <div id="nav-header">
        <!--로고-->
        <img src="../img/sidebar/logo.svg" alt="LOGO" id="logo" class="" onclick="GoHome()">
        <div id="logo-name">
            <span class="head-span1">URDO</span>
            <span class="head-span2">유머를 위한 알렉산드리아 도서관</span>
        </div>
        <div>
            <button id="arrow" onclick="moving_sidebar()">
                <img src="../img/sidebar/arrowLeft.png" alt="leftArrow">
            </button>
        </div>
    </div>

    <!--퀵 메뉴 시작-->
    <div id="Quick_menu">
        <table>
            <colgroup>
                <col id="Quick_col1">
                <col id="Quick_col2">
                <col id="Quick_col3">
            </colgroup>
            <tr onclick="MiniHomePage()">
                <td><img src="../img/sidebar/quick-home.svg" alt="MiniHomePage" class="navHIcon"></td>
                <td><span>내 미니홈피 바로가기</span></td>
                <td><img src="../img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
            </tr>
            <tr onclick="PointShop()">
                <td><img src="../img/sidebar/quick-shop.svg" alt="PointShop" class="navHIcon"></td>
                <td><span>포인트샵</span></td>
                <td><img src="../img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
            </tr>
            <tr onclick="MyPage()">
                <td><img src="../img/sidebar/quick-myPage.svg" alt="MyPage" class="navHIcon"></td>
                <td><span>마이 페이지</span></td>
                <td><img src="../img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
            </tr>
        </table>
        <div class="darkMode">
            <div class="sunMoon">
                <img src="../img/sidebar/quick-moon.svg" alt="#" class="Moon navHIcon">
                <img src="../img/sidebar/quick-sun.svg" alt="#" class="Sun navHIcon">
            </div>
            <span class="darkMode-text">다크 모드</span>
            <div class="toggle-switch">
                <span class="switch"></span>
            </div>
        </div>
    </div>
    <!--메뉴 바 시작-->
    <div id="Menu_bar">
        <span>게시판</span>

        <ul class="depth1">
            <li>
                <input type="checkbox" id="check1">
                <label for="check1">
                    <span class="plus_minus">&#65291</span>
                    <img src="../img/sidebar/menu-best.svg" alt="board" class="navIcon menuIcon">
                    <span>베스트 게시글</span>
                </label>
                <ul class="depth2">
                    <li><a href="bord_nowBest.jsp" title="실시간베스트">실시간 베스트</a></li>
                    <li><a href="board_monthBest.html" title="월간베스트">월간 베스트</a></li>
                    <li><a href="board_miniBest.html" title="미니홈피추천작">미니홈피 추천작</a></li>
                </ul>
            </li>
            <li>
                <input type="checkbox" id="check2">
                <label for="check2">
                    <span class="plus_minus">&#65291</span>
                    <img src="../img/sidebar/menu-humor.svg" alt="board" class="navIcon menuIcon">
                    <span>유머</span>
                </label>
                <ul class="depth2">
                    <li><a href="board_humor.html" title="웃긴 자료" id="active">웃긴 자료</a></li>
                </ul>
            </li>
            <li>
                <input type="checkbox" id="check3">
                <label for="check3">
                    <span class="plus_minus">&#65291</span>
                    <img src="../img/sidebar/menu-creation.svg" alt="board" class="navIcon menuIcon">
                    <span>창작게시판</span>
                </label>
                <ul class="depth2">
                    <li><a href="board_creArt.html" title="그림">그림</a></li>
                    <li><a href="board_creCook.html" title="요리">요리</a></li>
                </ul>
            </li>
            <li>
                <input type="checkbox" id="check4">
                <label for="check4">
                    <span class="plus_minus">&#65291</span>
                    <img src="../img/sidebar/menu-region.svg" alt="board" class="navIcon menuIcon">
                    <span>지역</span>
                </label>
                <ul class="depth2">
                    <li><a href="board_regionRestaurant.html" title="맛집">맛집</a></li>
                    <li><a href="board_regionLandMark.html" title="명소">명소</a></li>
                </ul>
            </li>
            <li>
                <input type="checkbox" id="check5">
                <label for="check5">
                    <span class="plus_minus">&#65291</span>
                    <img src="../img/sidebar/menu-theme.svg" alt="board" class="navIcon menuIcon">
                    <span>테마</span>
                </label>
                <ul class="depth2">
                    <li><a href="board_themeGame.html" title="게임">게임</a></li>
                    <li><a href="board_themeSports.html" title="스포츠">스포츠</a></li>
                    <li><a href="board_themeMusic.html" title="음악">음악</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--로그인/로그아웃 버튼-->
    <div id="loginWrap">
        <button onclick="Login()" class="btn">
            <img src="../img/sidebar/login-unlock.svg" alt="login" class="navIcon">
            <span>로그인</span>
        </button>
    </div>
</nav>


<section class="Main">
    <div class="container">
        <header>
            <div id="container_Title">
                게시판 > 유머 > 웃긴 자료
            </div>
            <div id="search">
                <div>웃긴 자료</div>
                <div>|</div>
                <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
                <img src="../img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon" id="searchBarIcon">
            </div>
        </header>
        
<!-- 메뉴 끝 -->

        
        <div class="container2">
            <div id="writeField">
                <div class="title_write_area">
                    <input type="text" class="URtitle" placeholder="제목을 입력해 주세요" name="urdoTitle">
                </div>

                <div class="main_write_area">
                    <textarea name="urdoContent" class="URmain" cols="30" rows="10" placeholder="내용을 입력해 주세요" maxlength="2048"></textarea>
       
               
               
               
                </div>

                <div class="filebox">
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                    <label for="file">파일찾기</label>
                    <input type="file" id="file">
                </div>

           <%--   <% 
             if(userID != null && userID.equals(urdo.getUserID())) // userID(로그인상태인지확인하는것) 가 없지않으며 userID가 bbs.getUserID()와 일치한다면 실행시킨다.(본인계정의 아이디로만 수정과 삭제가 작동함)
             {
            	 %> 	
             
                <div class="post">
                    <input type='button' value='돌아가기' class="CancelBtn" onclick="location.href = 'bord_nowBest.jsp?urdoID=<%= urdoID %>'">
                    <input type='submit' value='도서 수정(미완)' class="WriteBtn">
                     <a  onclick="return confirm('정말로 삭제하시겠습니까?')"  href="deleteAction.jsp?urdoID=<%= urdoID %>" class="btn btn-primary">삭제 </a>
                      <!-- urdoID가 들어가있지않기때문에 오류가뜸 -->
                    
                </div>
                 <%
		         }
		       %>
            </div> --%>
            
        </div> <!-- container 끝 -->
    
          
  
       
       
    </div>
    <script>
        $("#file").on('change', function()
        {
            let fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });
    </script>
</section>

<!--전체 JS-->
<script src="../js/common.js"></script>

</body>
</html>