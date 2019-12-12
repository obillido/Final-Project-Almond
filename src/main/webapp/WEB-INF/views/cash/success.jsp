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
</style>

<div id="container">
<h5><strong>캐시 충전</strong>이 완료되었습니다.</h5>
<br>
<div class="alert alert-info" role="alert" style="text-align:center;font-size:1.5em"><strong>충전 내역</strong></div>
<ul class="list-group">
  <li class="list-group-item d-flex justify-content-between align-items-center">
    충전금액
    <span class="badge badge-primary badge-pill">${info.price }원</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    결제방법
    <span class="badge badge-primary badge-pill">${info.method }</span>
  </li>
</ul>
<br><br>
<a href="${path}/cash/list?usernum=${usernum}" class="btn btn-info">내 캐시내역 보기</a>
</div>