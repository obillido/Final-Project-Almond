<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/resources/ticket/history.css" rel="stylesheet">

<div class="wrap">
	<div class="d1"> 
		<div class="d2">
    		[이용권 충전 내역]
	 		<c:forEach var="list" items="${tbh}"> 	
	    		<div>	
			   		충전일: ${list.REGDATE}<br>
			   		이용권충전한제목: ${list.TITLE}<br>
			   		<c:if test="${list.TYPE==1}">소장권:${list.CNT}개 </c:if>
			   		<c:if test="${list.TYPE==2}">대여권:${list.CNT}개 </c:if>
			   		<br>
		    		충전된캐시사용: ${list.PRICE }캐시<br>
			    	<hr>
	    		</div>
	   		</c:forEach> 	
   		</div>
   		
   		<div class="d3">
   			[이용권 사용 내역]
			<c:forEach var="list" items="${tuh}"> 	
	    		<div>	
	    		12121
			   		이용권 사용일:${list.USEDATE} <br>
			   		충전한 제목: ${list.SUBTITLE}, ${list.EPNUM}화 <br>
					대여권을 사용했는지, 소장권을 사용했는지
			    	<hr>
	    		</div>
	   		</c:forEach> 	
   		</div>
   		
	</div>
</div>
    