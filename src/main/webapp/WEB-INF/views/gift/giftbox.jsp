<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="${pageContext.request.contextPath}/resources/gift/giftbox.css" rel="stylesheet">

<div class="body">
	<div class="container">
	
	<div class="head" style="padding-bottom: 30px; border-bottom: inset; border-bottom-color: burlywood;">
		<div class="tabs" >
			<H4 style="text-align: center; padding-top: 15px; font-weight: 600; font-family: 고딕;">오늘의 선물</H4>
		</div>
	</div>	
	
		<div id="tab-1" class="tab-content current" >
			<c:forEach var="wv" items="${wv}">
				<div class="tab1_1" >
					<div class="tab1_2">
						<img src="${pageContext.request.contextPath}/resources/webcontents/${wv.CULTYPE}/${wv.IMG}" style="width:100px; float: left;">
						<div class="contents">
							<span style="font-weight: 600; font-family: 고딕; line-height: 200%;">${wv.TITLE}</span><br>
							<span style="color: rgba(0, 0, 0, 0.6); font-size: smaller;">
								<c:if test="${wv.CULTYPE==1 }">웹툰/만화</c:if> 
								<c:if test="${wv.CULTYPE==2 }">웹소설/장르</c:if> 
								<c:if test="${wv.CULTYPE==3 }">예능</c:if> 
								<c:if test="${wv.CULTYPE==4 }">드라마</c:if> 
								<c:if test="${wv.CULTYPE==5 }">영화</c:if> | ${wv.AGEGRADE}세
							<br>
							<br>
							<br>
							<br>
							<br> 
							<c:if test="${wv.TYPE==1}">소장권</c:if> 
							<c:if test="${wv.TYPE==2}">대여권</c:if>
							</span> 
							<span style="color: rgba(0, 0, 0, 0.6); font-size: smaller; color: green">
								${wv.CNT }개 
							</span>
						</div>
					</div>
					<div class="tab1_3">
						<button type="submit" class="contents1" id="btn1_gift">
							<span style="font-weight: 600; font-family: 고딕;"> 
								<c:choose>
									<c:when test="${empty wv.GIFTHNUM}">선물받기</c:when>
									<c:otherwise>받기완료</c:otherwise>
								</c:choose>
							</span>
						</button>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){
	//var btn = document.getElementById('btn1_gift');
	//		btn.disabled = 'disabled';
	});
</script>