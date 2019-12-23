<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>

<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/jqBootstrapValidation.js"/>"></script>
<script src="<c:url value="/resources/js/contact_me.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>


<style type="text/css">
   #container{margin-left:35px;}
   #div img{margin-left:40px;margin-top:50px;}
   #div2 img{margin-left:45px;margin-top:50px;}
   #div3 img{margin-left:40px;margin-top:50px;}
   html {overflow:hidden;}  
   #f{text-align: right;}
</style>

<script type="text/javascript">
	function go1(){ 
		opener.parent.location='${path}/event5'; 
		window.close(); 
	}
	function go2(){ 
		opener.parent.location='${path}/event4?eventnum=10'; 
		window.close(); 
	}
	function go3(){ 
		opener.parent.location='${path}/event1'; 
		window.close(); 
	}
	function go4(){ 
		opener.parent.location='${path}/event2?eventnum=5'; 
		window.close(); 
	}
	
	function setCookie( name, value, expiredays ){ 
		var todayDate = new Date(); 
		todayDate.setDate( todayDate.getDate() + expiredays ); 
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString 
		() + ";";
	} 
	function closeWin() { 
		if ( document.cnjform.notice.checked ) // 폼네임 cnjform 은 동일해야 합니다. 
			setCookie("CookieName", "no" , 1); // 부모창에서 지정한 쿠키네임과 일치 해야 합니다. 
		} 
		top.close(); 
	} 

	
</script>

</head>
<body>
<div id="container">
	<div class="row">
		<div class="card bg-dark text-white" onclick="go1()" style="width:330px;height:330px;">
		  <img src="${path }/resources/rull/pan1.png" class="card-img" style="width:330px;height:330px;">
		  <div class="card-img-overlay">
		    <h5 class="card-title">EVENT 1</h5>
		  </div>
		</div>
		<div class="card bg-dark text-white" onclick="go2()" style="width:330px;height:330px;" id="div">
		  <img src="${path }/resources/suhyeonimages/퀴즈.jpg" class="card-img" style="width:250px;height:250px;">
		  <div class="card-img-overlay">
		    <h5 class="card-title">EVENT 2</h5>
		  </div>
		</div>
	</div>
	<div class="row">
	<div class="card bg-dark text-white" onclick="go3()" style="width:330px;height:330px;" id="div2">
	  <img src="${path }/resources/suhyeonimages/이벤트표지.jpg" class="card-img" style="width:250px;height:250px;">
	  <div class="card-img-overlay">
	    <h5 class="card-title">EVENT 3</h5>
	  </div>
	</div>
	<div class="card bg-dark text-white" onclick="go4()" style="width:330px;height:330px;" id="div3">
	  <img src="${path }/resources/suhyeonimages/세종.jpg" class="card-img" style="width:250px;height:250px;">
	  <div class="card-img-overlay">
	    <h5 class="card-title">EVENT 4</h5>
	  </div>
	</div>
    </div>
   
    <form name="cnjform" id="f"> 
       <input type="checkbox" name="notice" onclick="closeWin()">오늘 하루 동알 열지 않기
    </form>

    
</div>
</body>
</html>