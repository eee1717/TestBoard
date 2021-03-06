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
    <link rel="stylesheet" href="../css/boardNoWrite.css">
    <!-- JQ -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    

    <script>
        $(document).ready(function()
        {
            let span = document.querySelectorAll('.depth1 span');
            $('#check1').prop('checked', true);
            span[0].innerHTML = '&#65293';
            span[1].style.color = getColor('--color-point');
            span[1].style.fontWeight = 'bold';
            $('#active').css('color', getColor('--color-active')).css('font-weight', 'bold');
        })
    </script>
    </head>


<body>

<!-- userID가 세션에 입력되있는지 확인용도 -->
<%
   String userID = null;
   if(session.getAttribute("userID") != null){
	   userID =(String) session.getAttribute("userID");
   }
   
   /* 몇번쨰 페이지인지 알기위해서 만든코드  */
   int pageNumber = 1;
   if (request.getParameter("pageNumber") !=null ){
	   pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
   }
   
   
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
                    <li><a href="bord_nowBest.jsp" title="실시간베스트" id="active">실시간 베스트</a></li>
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
                    <li><a href="board_humor.html" title="웃긴 자료">웃긴 자료</a></li>
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
           <% 
        if(userID== null){
        %>
        <button onclick="Login()" class="btn">
            <img src="../img/sidebar/login-unlock.svg" alt="login" class="navIcon">
            <span>로그인</span>
        </button>
        
     <%    
      }
      else{
      %>
         <button onclick="logoutAction.jsp" class="btn">
            <img src="../img/sidebar/login-unlock.svg" alt="login" class="navIcon">
            <span>로그아웃</span>
        </button>
      <%
      }        
        %>
    </div>
</nav>
<section class="Main">
    <div class="container">
        <div id="container_Title">
            게시판 > 베스트 게시글 > 실시간 베스트
        </div>
        <div id="search">
            <div>실시간 베스트</div>
            <div>|</div>
            <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
            <img src="../img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon" id="searchBarIcon">
        </div>

        <!-- 게시판 내용 관련 코드 -->
        <!-- 게시판윗부분 시작 -->
        <div class="board_list_wrap">
            <select class="sel">
                <option>5개</option>
                <option selected>10개</option>
                <option>15개</option>
                <option>20개</option>
                <option>30개</option>
            </select>
            <select class="sel" id="seltwo">
                <option>전체</option>
                <option>유머</option>
                <option>공감</option>
            </select>
            <!-- 게시판 Table -->
            <table class="board_list" id="t1">
                <colgroup>
                    <col id="boardCol1">
                    <col id="boardCol2">
                    <col id="boardCol3">
                    <col id="boardCol4">
                    <col id="boardCol5">
                    <col id="boardCol6">
                </colgroup>
                <tr class="titlename">
                    <td class="tname">번호</td>
                    <td class="tname">썸네일</td>
                    <td class="tname" id="titleboard">글제목</td>
                    <td class="tname">조회</td>
                    <td class="tname">추천</td>
                    <td class="tname">글쓴이</td>
                    <td class="tname">날짜</td>
                </tr>
                
                <!-- 게시판 내용물 시작 -->
               <% 
                UrdoDAO urdoDAO = new UrdoDAO();
                ArrayList<Urdo> list = urdoDAO.getList(pageNumber);
                
                for(int i=0; i<list.size(); i++)
                {  
               %>
           <tr>
             <td><%= list.get(i).getUrdoID() %></td> <!-- 작성자 -->
             <td><a href="#"></a> </td>
             <td><a href ="boardContent.jsp?UrdoID=<%= list.get(i).getUrdoID() %>"> <%=list.get(i).getUrdoTitle() %></a></td> <!-- 글제목 -->
             <td><%= list.get(i).getLookup() %> </td> <!-- 조회수 -->
             <td><%= list.get(i).getRecommend() %> </td> <!-- 추천수 -->
             <td><%= list.get(i).getUserID() %> </td> <!-- 글쓴이 -->
             <td><%= list.get(i).getUrdoDate().substring(0,11)+ list.get(i).getUrdoDate().substring(11,13)+"시"+list.get(i).getUrdoDate().substring(14,16) +"분" %> </td><!-- 작성일 -->
           </tr>
           <%
                }
           %>
                
          <!--   <tr>
            <td>작성자</td>
            <td>글제목탈룰라</td>
            <td>추천수</td>
            <td>조회수</td>
            <td>아이디</td>
            <td>탈룰라</td>
            </tr> -->
                
            </table>
            <!--  페이지 숫자 -->
        </div>
        <!-- 페이지네이션 시작 -->
        <div class="boardfoot">
            <div class="page_wrap">
                <img class="page_arrow menuIcon" id="prev" src="../img/board/page-arrow-back.svg">
                <div class="page_nation">
                    <a href="#" class="page_num on">1</a>
                    <a href="#" class="page_num">2</a>
                    <a href="#" class="page_num">3</a>
                </div>
                <img class="page_arrow menuIcon" id="next" src="../img/board/page-arrow-forward.svg">
            </div>
            <!--  페이지 숫자 끝-->
            <a href="board_humorWrite.jsp" >글쓰기</a>
            <!-- 게시판 내용 관련 코드  끝-->
        </div>
        
        
        
        
    </div>
</section>

<!--전체 JS-->
<script src="../js/common.js"></script>
<!--포인트샵 JS-->
<script src="../js/pointShop.js"></script>
<!--게시판 JS-->
<script src="../js/board.js"></script>

</body>





</html>