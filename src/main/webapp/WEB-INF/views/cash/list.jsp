<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:100px;   
      padding-bottom:100px;
      width:40%;
    }
    button{text-align:center;}
</style>

<div id="container">

<button type="button" class="btn btn-warning">내 보유 캐시: ${totCash }</button>

<br><br><br>
<div class="row">
<ul class="list-group">
   <li class="list-group-item list-group-item-warning">총 충전 금액 : ${totCharge}</li>
   <c:forEach var="info" items="${list }">
	  <li class="list-group-item">충전 금액: ${info.price }원  / 충전일 : ${info.regdate }</li>
   </c:forEach>
</ul>
<ul class="list-group">
   <li class="list-group-item list-group-item-warning">총 이용 금액 : ${totUse}</li>
   <c:forEach var="infoUse" items="${listUse }">
	  <li class="list-group-item">충전 금액: ${infoUse.price }원  / 충전일 : ${infoUse.regdate }</li>
   </c:forEach>
</ul>
</div>
</div>

