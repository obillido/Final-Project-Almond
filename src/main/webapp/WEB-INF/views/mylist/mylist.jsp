<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:300px;   
      padding-bottom:300px;
      width:70%;
    }
    .card{margin:10px;}
</style>

<div id="container">
<div class="row">
<c:forEach var="info" items="${list }">
  <div class="card" style="width:250px" onclick="location.href='${path}/webcontents/episode/list?contnum=${info.contnum}'">
  <img src="${path}/resources/webcontents/${info.cultype}/${info.img}" class="card-img-top" height="200">
  <div class="card-body">
    <h5 class="card-title"><strong>${info.title }</strong></h5>
     <p class="card-text">열람날짜 : ${info.readingdate }</p>
    <a href="${path }/mylist/delete?mylistnum=${info.mylistnum}" class="btn btn-warning">보관함에서 삭제</a>
  </div>
  </div>
</c:forEach>
</div>
</div>
