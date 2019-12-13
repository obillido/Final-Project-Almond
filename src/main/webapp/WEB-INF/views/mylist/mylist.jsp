<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:300px;   
      padding-bottom:300px;
      width:30%;
    }
    .card{margin:20px;}
</style>

<div id="container">

<c:forEach var="info" items="${list }">
  <div class="card" style="width:400px" onclick="location.href='${path}/webcontents/episode/list?contnum=${info.contnum}'">
  <img src="${path}/resources/webcontents/${info.cultype}/${info.img}" class="card-img-top" height="300">
  <div class="card-body">
    <h5 class="card-title"><strong>${info.title }</strong></h5>
    <c:if test="${info.completiontype==0 }"><p class="card-text">완결</p></c:if>
    <a href="${path }/mylist/delete?mylistnum=${info.mylistnum}" class="btn btn-warning">보관함에서 삭제</a>
    
    <c:if test="${info.alaram==1 }">
       <a href="#"><img src="${path }/resources/suhyeonimages/유알람.png" width="30"></a>
    </c:if>
    <c:if test="${info.alaram==2 }">
       <a href="#"><img src="${path }/resources/suhyeonimages/무알람.png" width="30"></a>
    </c:if>
  </div>
  </div>
</c:forEach>

</div>
