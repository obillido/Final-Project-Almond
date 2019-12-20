<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="${pageContext.request.contextPath}/resources/ticket/history.css" rel="stylesheet">

<div class="body">
	<div class="container">
	
	<div class="head" style="padding-bottom: 30px; border-bottom: inset; border-bottom-color: burlywood;">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1" id="tab1"><span id="btn_ticket1" style="font-weight: 600; font-family: 고딕; ">이용권 충전 내역</span></li>
			<li class="tab-link" data-tab="tab-2" id="tab2"><span id="btn_ticket2" style="font-weight: 600; font-family: 고딕;">이용권 사용 내역</span></li>
		</ul>
	</div>	
	
	
		<div id="tab-1" class="tab-content current">
			<c:forEach var="list" items="${tbh}">
				<div class="tab1_1">
					<div class="tab1_2">
						<span style="color: rgba( 0, 0, 0, 0.6 );">
						<fmt:formatDate value="${list.REGDATE}" pattern="yyyy-MM-dd hh:mm:ss" /><br></span> <br> <span style="color: rgba( 0, 0, 0, 0.6 );">${list.TITLE}<br> </span> <br>
						<c:if test="${list.TYPE==1}"><span style="font-weight: 600; font-family: 고딕;">소장권: ${list.CNT}개</span></c:if>
						<c:if test="${list.TYPE==2}"><span style="font-weight: 600; font-family: 고딕;">대여권: ${list.CNT}개 </span></c:if>
					</div>
					<div class="tab1_3">
						<br><span style="font-weight: 800; color:04B404; text-align: right;">${list.PRICE }캐시</span><br>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>


		<div id="tab-2" class="tab-content">
			<c:forEach var="list" items="${tuh}">
				<div class="tab1_1">
					<div class="tab1_2">
						<span style="color: rgba(0, 0, 0, 0.6);">
						<fmt:formatDate value="${list.USEDATE}" pattern="yyyy-MM-dd hh:mm:ss"/><br></span>
						<br> <span style="color: rgba(0, 0, 0, 0.6);">${list.TITLE} 
						<c:if test="${list.COMPLETIONTYPE==0}">[연재중]</c:if>
						<c:if test="${list.COMPLETIONTYPE==1}">[완결]</c:if><br>
						</span> <br>
						<span style="font-weight: 600">${list.SUBTITLE} ${list.EPNUM}화</span>
					</div>
					<div class="tab1_3"><br>
						<c:if test="${list.TYPE==1}"><span style="font-weight: 800; color: 04B404; text-align: right; ">소장 이용권 사용</span></c:if>
						<c:if test="${list.TYPE==2}"><span style="font-weight: 800; color: 04B404; text-align: right; ">대여 이용권 사용</span></c:if>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#tab2").click(function(){
		$("#tab1").css("opacity","0.5");
	});
	$("#tab1").click(function(){
		$("#tab1").css("opacity","1");
	});
	$("#tab1").click(function(){
		$("#tab2").css("opacity","0.5");
	});
	$("#tab2").click(function(){
		$("#tab2").css("opacity","1");
	});
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');
		
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});
});
</script>