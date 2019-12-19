<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="${pageContext.request.contextPath}/resources/gift/giftbox.css" rel="stylesheet">

<div class="body">
	<div class="container">
	
	<div class="head">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1" id="tab1"><span id="btn_ticket1" style="font-weight: 600; text-decoration: underline; font-family: 고딕;">이용권 충전 내역</span></li>
			<li class="tab-link" data-tab="tab-2" id="tab2"><span id="btn_ticket2" style="font-weight: 600; opacity: 0.5; text-decoration: underline; font-family: 고딕;">이용권 사용 내역</span></li>
		</ul>
	</div>	
	
	
		<div id="tab-1" class="tab-content current">
			<c:forEach var="wv" items="${wv}">
				<div class="tab1_1">
					<div class="tab1_2">
						${wv.img }
					</div>
					<div class="tab1_3">
					
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>


		<div id="tab-2" class="tab-content">
			
				<div class="tab1_1">
					<div class="tab1_2">
					</div>
					<div class="tab1_3"><br>
					
					</div>
				</div>
				<hr>
			
		</div>
	</div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#tab2").click(function(){
		$("#btn_ticket1").css("opacity","0.5");
	});
	$("#tab1").click(function(){
		$("#btn_ticket1").css("opacity","1");
	});
	$("#tab1").click(function(){
		$("#btn_ticket2").css("opacity","0.5");
	});
	$("#tab2").click(function(){
		$("#btn_ticket2").css("opacity","1");
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