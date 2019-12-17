<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="container">
<br><br><br><br>
<p class="card-text"><mark><strong>[ ${keyword} ]</strong></mark>(으)로 검색하신 결과입니다.</p>
<hr style="border:0.7px solid gray;">
<c:forEach var="info" items="${list }">
<div class="card mb-3" style="max-width:1200px;border:1px solid darkorange;">
  <div class="row no-gutters">
    <div class="col-md-4">
    <a href="${path}/webcontents/episode/list?contnum=${info.contnum}">
      <img src="${path}/resources/webcontents/${info.cultype }/${info.img }" style="width:350px;height:300px;" class="card-img">
    </a>
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h4 class="card-title">
        <strong>${info.title }</strong>
        <small>
        <c:choose>
           <c:when test="${info.completiontype==0}">
           <span class="badge badge-pill badge-warning" style="font-size:0.7em">연재중</span></c:when>
           <c:otherwise>
           <span class="badge badge-pill badge-warning" style="font-size:0.7em">완결</span></c:otherwise>
        </c:choose>
        </small>
        </h4>
        <br>
        <p class="card-text"><strong>카테고리</strong>
        <c:choose>
           <c:when test="${info.cultype==1 }">만화</c:when>
           <c:when test="${info.cultype==2 }">소설</c:when>
           <c:when test="${info.cultype==3 }">예능</c:when>
           <c:when test="${info.cultype==4 }">드라마</c:when>
           <c:otherwise>영화</c:otherwise>
        </c:choose>
        </p>
        <p class="card-text"><strong>장르</strong> ${info.genre }</p>
        <p class="card-text"><strong>구독자수</strong> ${info.readernum }명</p>
      </div>
    </div>
  </div>
</div>
</c:forEach>
<br><br><br><br>
</div>
