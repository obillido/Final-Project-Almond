<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:50px;   
      padding-bottom:50px;
      width:30%;
    }
</style>

<div id="container">
<h5><strong>캐시 충전</strong>이 완료되었습니다.</h5>
<br>
<div class="alert alert-info" role="alert">충전 내역</div>
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
</div>