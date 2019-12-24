<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
	.event-img{width:540px; height:340px; text-align:center;}
	.endmark{
		background-color:grey;
		color:white;
		display:inline-block;
		padding-bottom:3px;
		width:70px;
		text-align:center;
		border-radius:5px;
	}
</style>

<script>
	function eventMove(eventnum,status){
		if(status<20){
			location.href="${path}/event/";
		}else if(status<30){
			
		}else if(status<40){
			
		}else{
			
		}
	}
</script>

<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<h1 class="mt-4 mb-3">
		이벤트
		<c:if test="${not empty userStatus}">
			<a href="${path}/event/choice" class="btn btn-outline-dark">이벤트 등록</a>
		</c:if>
	</h1>
	
  
	<div class="row">	
		<c:forEach var="vo" items="${eventList}">
		  <div class="col-lg-6 portfolio-item" onclick="javascript:eventMove(${vo.eventnum},${vo.status})">
		    <div class="card h-100">
		    	<c:choose>
		    		<c:when test="${empty vo.img}">
		    			<c:choose>
								<c:when test="${vo.status<40}">
									<img class="card-img-top event-img" src="${path}/resources/event/roulette.png">
								</c:when>
								<c:otherwise>
									<img class="card-img-top event-img" src="${path}/resources/event/almond.png">
								</c:otherwise>
		    			</c:choose>
		    		</c:when>
		    		<c:otherwise>
		    			<img class="card-img-top event-img" src="${path}/resources/event/${vo.img}">
		    		</c:otherwise>
					</c:choose>
		      <div class="card-body">
		        <h4 class="card-title">
		        	<c:if test="${vo.enddate<=sysdate}">
		        		<div class="endmark">종료</div>
		        	</c:if>
							<c:choose>
								<c:when test="${vo.status<20}">열람 이벤트</c:when>
								<c:when test="${vo.status<30}">리뷰 이벤트</c:when>
								<c:when test="${vo.status<40}">룰렛 이벤트</c:when>
								<c:otherwise>쿠폰 이벤트</c:otherwise>
							</c:choose>
		        </h4>
		        <p class="card-text">${vo.startdate} ~ ${vo.enddate}</p>
		      </div>
		    </div>
		  </div>
		</c:forEach>
	</div>
</div>
  
