<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="container">
	<h1 class="mt-4 mb-3">Webcontents
	  <small>분류</small>
	</h1>
	
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
		  <a href="${cp}/">홈</a>
		</li>
	  <li class="breadcrumb-item active">타입선택</li>
	</ol>  
	
	
	
	<div class="row">
		<div class="col-lg-8 mb-4">
			<h3>등록</h3><br>
			<button class="btn btn-primary" onclick="location.href='${path}/webcontents/regiForm?cultype=1'">웹툰/만화</button>
			<button class="btn btn-primary" onclick="location.href='${path}/webcontents/regiForm?cultype=2'" >웹소설/장르</button>
			<button class="btn btn-primary" onclick="location.href='${path}/webcontents/regiForm?cultype=3'" >예능</button>
			<button class="btn btn-primary" onclick="location.href='${path}/webcontents/regiForm?cultype=4'" >드라마</button>
			<button class="btn btn-primary" onclick="location.href='${path}/webcontents/regiForm?cultype=5'" >영화</button>
			<br>
	  </div>
	</div>
</div>