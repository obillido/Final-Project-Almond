<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrap">
	<div class="d1"> 
    	[이용권충전내역]
 	<c:forEach var="vo" items="${list }"> 	
    	<div>	
	   		 등록일: ${vo.regdate }<br>
	   		 제목: <br>
	   		 이용권: 개<br>
	   		 소장권: 개<br>
    		캐시사용: 캐시<br>
	    	<hr>
    	</div>
   </c:forEach> 	
	</div>
</div>
    