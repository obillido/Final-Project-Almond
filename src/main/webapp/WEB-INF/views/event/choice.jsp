<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
	window.onload=function(){
		if(${code!=null}){
			alert("${code}");
		}
	}
</script>


<div class="container">
	<h1 class="mt-4 mb-3">이벤트
	  <small>등록</small>
	</h1>
	
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
		  <a href="${path}/">홈</a>
		</li>
	  <li class="breadcrumb-item active">등록할 컨텐츠 타입을 선택하시오.</li>
	</ol>  
	
	
	
	<div class="row">
		<div class="col-lg-8 mb-4">
			<h3>등록</h3><br>
			<button class="btn btn-primary" onclick="location.href='${path}/event/regiForm?status=10'">열람 이벤트</button>
			<button class="btn btn-primary" onclick="location.href='${path}/event/regiForm?status=20'">리뷰 이벤트</button>
			<button class="btn btn-primary" onclick="location.href='${path}/event/regiForm?status=30'">룰렛 이벤트</button>
			<button class="btn btn-primary" onclick="location.href='${path}/event/regiForm?status=40'">키워드 이벤트</button>
			<br>
	  </div>
	</div>
</div>