<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<style>
	.logo{width:20%; text-align:right; }
	.category{text-align:center !important; width:30%; padding:0px 20px; }
	#search{width:250px; min-width:220px; width:20%; text-align:center; }
</style>


<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top border-bottom" style="background-color:white !important;">
  
	<div class="logo">
  	<a class="navbar-brand" href="${path}/"><img src="${path}/resources/suhyeonimages/logo.png" width="200px"></a>
    </div>
  
  
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
 
  <div class="collapse navbar-collapse category" id="navbarResponsive">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="${path}/webcontents/list?cultype=1" style="color:black !important;font-size: 1.5em"><strong>만화</strong></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path}/webcontents/list?cultype=2" style="color:black !important;font-size: 1.5em"><strong>소설</strong></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path}/webcontents/list?cultype=3" style="color:black !important;font-size: 1.5em"><strong>예능</strong></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path}/webcontents/list?cultype=4" style="color:black !important;font-size: 1.5em"><strong>드라마</strong></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path}/webcontents/list?cultype=5" style="color:black !important;font-size: 1.5em"><strong>영화</strong></a>
      </li>
 
      <li class="nav-item dropdown" style="width:150px !important;">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black !important;">
     		 <span class="badge badge-dark" style="font-size: 1.3em;background-color:darkorange;color:white; padding-bottom:8px;">MyPage</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
          <a class="dropdown-item" href="${path}/cash/charge">캐시 충전</a>
          <a class="dropdown-item" href="${path}/cash/list">캐시 내역</a>
          <a class="dropdown-item" href="${path}/mylist/list">보관함</a>
          <a class="dropdown-item" id="ticket_history" href="javascript:popupOpen();">이용권 내역</a>
          <a class="dropdown-item" href="#">이벤트/쿠폰</a>
          <a class="dropdown-item" href="${path}/inquiry/inquirypage">1:1문의</a>
          <a class="dropdown-item" href="#">로그아웃</a>
        </div>
      </li>          
    </ul>
  </div>      
 

<form id="search" class="form-inline" method="post" action="${path }/search" style="min-width:265px;"> 
   <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요" style="min-width:200px;">
   <button class="btn btn-secondary" type="submit" style="border:1px solid darkorange;background-color:darkorange; margin-left:5px;">검색</button>
</form> 
 
</nav>

<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
var wnd;
function popupOpen(form){
	var popupX = (window.screen.width / 2) - (580 / 2);
	var popupY= (window.screen.height /2) - (730 / 2);
	var popUrl = "${pageContext.request.contextPath}/ticket/history";
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
	if(wnd){
		wnd.close();
	}
	wnd = window.open(popUrl, '', 'status=no, height=710, width=510, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}
	
</script>