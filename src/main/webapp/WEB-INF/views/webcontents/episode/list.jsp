<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
	window.onload=function(){
		if(${code!=null}){
			if(${code=='1'}) alert("성공적으로 등록외었습니다.");
			else alert("등록실패");
		}
	}
</script>


<!-- Page Content -->
<div class="container">
	<br>
  <ol class="breadcrumb">
    <li class="breadcrumb-item active">
	    <c:choose>
				<c:when test="${contInfo.cultype==1}">만화</c:when>
				<c:when test="${contInfo.cultype==2}">소설</c:when>
				<c:when test="${contInfo.cultype==3}">예능</c:when>
				<c:when test="${contInfo.cultype==4}">드라마</c:when>
				<c:when test="${contInfo.cultype==5}">영화</c:when>
			</c:choose>
		</li>
    <li class="breadcrumb-item active">${contInfo.title}</li>
  </ol>

	<!-- Intro Content -->
  <div class="row">
    <div class="col-lg-6">
      <img class="img-fluid rounded mb-4" src="${path}/resources/webcontents/${contInfo.cultype}/${contInfo.img}" style="width:600px; height:600px;">
    </div>
    <div class="col-lg-6">
      <h2>${contInfo.title}</h2>
      <br><br>
			<c:choose>
				<c:when test="${contInfo.cultype==1||contInfo.cultype==2}">
					<p>${contInfo.writer}</p>
					<p>${contInfo.illustrator}</p>
					<p>${contInfo.publisher}</p>
				</c:when>
				<c:otherwise>
					<p>${contInfo.director}</p>
					<p>${contInfo.actor}</p>
					<p>${contInfo.runtime}분</p>
					<p>개봉일 : ${contInfo.proddate}</p>
				</c:otherwise>
			</c:choose>
			<p><c:choose><c:when test="${contInfo.completiontype==0}">연재중</c:when><c:otherwise>완결</c:otherwise></c:choose></p>
			<a href="${path}/webcontents/episode/regi?cultype=${contInfo.cultype}&contnum=${contInfo.contnum}" class="btn btn-primary">회차 등록</a>
    </div>
  </div>
  <!-- /.row -->



	<br><br>
  <div class="card h-100">
    <ul class="list-group list-group-flush">
      <li class="list-group-item">
      	<span style="color:blue !important">${contInfo.readernum}</span>명이 보는 중 
      	 전체댓글
      </li>
      <li class="list-group-item">공지사항</li>
      <li class="list-group-item">첫편부터 ${contInfo.waiting}편 무료</li>
      <li class="list-group-item">기다리면 무료</li>
    </ul>
  </div>
	<br><br>



	<div style="float:right;">
		<ul style="list-style:none;">
			<li style="display:inline;"><a href="${path}/webcontents/episode/list?cultype=${contInfo.cultype}&contnum=${contInfo.contnum}&align=asc" style="text-decoration:none; color:black;">첫편부터</a></li>
			|
			<li style="display:inline;"><a href="${path}/webcontents/episode/list?cultype=${contInfo.cultype}&contnum=${contInfo.contnum}&align=desc" style="text-decoration:none; color:black;">최신편부터</a></li>
		</ul>
	</div>
	<br><br>

  <!-- 회차 목록 -->
  <c:forEach var="ep" items="${epiList}">
  	<div class="card mb-4" onclick="location.href='${path}/webcontents/episode/content?contnum=${contInfo.contnum}&epinum=${ep.epinum}'">
	    <div class="card-body">
	      <div class="row">
	        <div class="col-lg-6" style="max-height:200px; overflow:hidden !important">
	            <img class="img-fluid rounded" style="margin-top:-20%;" src="${path}/resources/webcontents/${contInfo.cultype}/${ep.thumbnail}">
	        </div>
	        <div class="col-lg-6">
	          <h2 class="card-title">${ep.epnum}화</h2>
	          <p class="card-text">${ep.subtitle}</p>
	        </div>
	      </div>
	    </div>
	    <div class="card-footer text-muted">${ep.uploaddate}</div>
	  </div>
  </c:forEach>
</div>
