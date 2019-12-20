<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:200px;   
      padding-bottom:100px;
      width:40%;
    }
</style>

<div id="container">
<c:if test="${usernum==1 }">
	<a href="${path }/notice/insert?contnum=${contnum}">
		<button type="button" class="btn btn-link" style="border:0.5px solid gray">공지사항 등록</button>
	</a>
	<br><br>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="info" items="${list }">
		<div class="card" style="width: 50rem;">
		  <div class="card-header">제목 : ${info.title }</div>
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item">내용 : ${info.content }</li>
		    <li class="list-group-item">등록일 : ${info.regdate }</li>
		  </ul>
		</div>
		<br><br>
	</c:forEach>
</c:if>
</div>