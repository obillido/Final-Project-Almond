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
    .card{margin:20px;border:0.5px solid lightgray;border-radius:30px;}
    .card img{border-radius:30px;}
    h5{text-align:center;}
    #title{width:200px;height:40px;margin-left:250px;background-color:black;
          font-size:1.2em;font-weight:900;font-family:sans-serif;
          border:0.5px solid black;border-radius:60px;color:white;}
 
</style>

<div id="container">
<br>
<input type="button" id="title" class="btn-3d green" value="My List" disabled="disabled">
<hr>
<br>
<c:forEach var="info" items="${list }">
<div class="card mb-3" style="width:700px">
  <div class="row no-gutters">
    <div class="col-md-4" onclick="location.href='${path}/webcontents/episode/list?contnum=${info.contnum}'">
      <img src="${path}/resources/webcontents/${info.cultype}/${info.img}" class="card-img" height="300">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h3 class="card-title"><strong>${info.title }</strong>
        <small>
        <c:if test="${info.completiontype==0 }"><span class="badge badge-pill badge-secondary">완결</span></c:if>
        <c:if test="${info.completiontype==1 }"><span class="badge badge-pill badge-secondary">연재중</span></c:if>
        </small>
        </h3>
        <br>
        <c:if test="${info.alaram==1 }">
        <a href="#"><img src="${path }/resources/suhyeonimages/유알람.png" width="30"></a>
        </c:if>
        <c:if test="${info.alaram==2 }">
        <a href="#"><img src="${path }/resources/suhyeonimages/무알람.png" width="30"></a>
        </c:if>
        <br><br>
        <a href="${path }/mylist/delete?mylistnum=${info.mylistnum}" class="btn btn-outline-secondary">보관함에서 삭제</a>
      </div>
    </div>
  </div>
</div>
</c:forEach>
</div>


