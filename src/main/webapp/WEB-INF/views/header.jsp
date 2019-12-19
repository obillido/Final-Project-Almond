<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<style>
	.logo{width:20%; text-align:right; }
	.category-box{text-align:center !important; min-width:500px;}
	.category-box .category{color:black !important;font-size: 1.5em; display:inline-block; padding:0px 20px; font-weight:bold;}
	#search{width:250px; min-width:265px; width:20%; text-align:center; margin-left:50px;}
	#search .searchBtn{border:1px solid darkorange;background-color:darkorange; margin-left:5px;}
	
	.badge-notification {
		 position: relative;
	}
	.badge-notification[data-badge]::after {
	  content: attr(data-badge);
		position: absolute;
		top: -11px;
		right: -10px;
		display: flex;
		justify-content: center;
		align-content: center;
		width: 22px;
		height: 22px;
	  line-height: 22px;
	  font-size: 12px;
	  font-weight: 600;
		border-radius: 50%;
	  background: var(--secondary);
	  background-color:red;
	  color: #fff;
	}
	
	#alarmList{
		overflow-y:scroll;
		width:350px; max-height:600px;
		margin-top:12px;
	}

	#login-box{width:260px; text-align:right;}
</style>


<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top border-bottom" style="background-color:white !important;">
  
	<div class="logo" style="min-width:200px;">
  	<a class="navbar-brand" href="${path}/"><img src="${path}/resources/suhyeonimages/logo.png" width="200px"></a>
  </div>
  
  
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

	<div class="collapse navbar-collapse category-box" id="navbarResponsive">
		<ul class="navbar-nav ml-auto">
		  <li class="nav-item dropdown">
				<a class="category" href="${path}/webcontents/list?cultype=1">만화</a>
			</li>
			<li class="nav-item dropdown">
				<a class="category" href="${path}/webcontents/list?cultype=2">소설</a>
			</li>
			<li class="nav-item dropdown">
				<a class="category" href="${path}/webcontents/list?cultype=3">예능</a>
			</li>
			<li class="nav-item dropdown">
				<a class="category" href="${path}/webcontents/list?cultype=4">드라마</a>
			</li>
			<li class="nav-item dropdown">
				<a class="category" href="${path}/webcontents/list?cultype=5">영화</a>
			</li>
		</ul>
	</div>
 
 

	<div id="search">
		<form class="form-inline" method="post" action="${path }/search"> 
		   <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요" style="min-width:200px;">
		   <button class="btn btn-secondary searchBtn" type="submit">검색</button>
		</form> 
	</div>
	 
	 
	<c:choose>
		<c:when test="${not empty usernum}">
		  <div class="collapse navbar-collapse mypage" id="navbarResponsive">
		    <ul class="navbar-nav ml-auto">
		      <li class="nav-item dropdown" style="width:150px !important;">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black !important;">
		     		 <span class="badge badge-dark" style="font-size: 1.3em;background-color:darkorange;color:white; padding-bottom:8px;">${nickname}님</span>
		        </a>
		        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
		          <a class="dropdown-item" href="${path}/cash/charge">캐시 충전</a>
		          <a class="dropdown-item" href="${path}/cash/list">캐시 내역</a>
		          <a class="dropdown-item" href="${path}/mylist/list">보관함</a>
		          <a class="dropdown-item" id="ticket_history" href="javascript:popupOpen();">이용권 내역</a>
		          <a class="dropdown-item" href="#">이벤트/쿠폰</a>
		          <a class="dropdown-item" id="giftbox" href="javascript:giftOpen();">선물함</a>
		          <a class="dropdown-item" href="${path}/inquiry/inquirypage">1:1문의</a>
		          <a class="dropdown-item" href="${path}/users/logout">로그아웃</a>
		        </div>
		      </li>          
		    </ul>
		  </div>    
    </c:when>
    <c:otherwise>
    	<div id="login-box">
    		<a href="${path}/users/login">로그인</a>
    	</div>
    </c:otherwise>
	</c:choose>
	 
	 
	<c:if test="${not empty usernum}">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown" data-toggle="dropdown">
					<div class="d-block btn btn-outline badge-notification" id="alarm">
						<img src="${path}/resources/alarm/message.PNG" width="30px;">
					</div>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio" id="alarmList">
				</div>
			</li>
		</ul>
	</c:if>
 
	 
	</nav>

<script type="text/javascript">
	var wnd;
	var wnd1;
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
	function giftOpen(form){
		var popupX = (window.screen.width / 2) - (580 / 2);
		var popupY= (window.screen.height /2) - (730 / 2);
		var popUrl = "${pageContext.request.contextPath}/gift/giftbox";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		if(wnd1){
			wnd1.close();
		}
		wnd1 = window.open(popUrl, '', 'status=no, height=710, width=510, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}

	$(document).ready(function(){
		if(${not empty usernum}){
			$.ajax({
				url:"${path}/alarm/list",
				dataType:"xml",
				success:function(data){
					let vc=true;
					$("#alarmList div").remove();
					$(data).find("alarm").each(function(){
						vc=false;
						var div="<div class='dropdown-item'><p>"+$(this).find("title").text()+"</p>"+
										"<p>"+$(this).find("content").text()+"</p></a>";
						$("#alarmList").append(div);
					});
					var cnt=$(data).find("cnt").text();
					if(cnt>0){
						$("#alarm").addClass("badge-notification");
						$("#alarm").attr("data-badge",cnt);
					}
					if(vc) $("#alarmList").append("<div><p>알람 내역이 업습니다.</p></div>");
				}
			});
		}
	});
</script>