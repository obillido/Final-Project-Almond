<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:50px;   
      padding-bottom:50px;
      width:40%;
    }
</style>

<div id="container">
<ul class="list-group">
   <li class="list-group-item active">총 보유 캐시 : ${totcash}</li>
   <c:forEach var="info" items="${list }">
	  <li class="list-group-item">충전 금액: ${info.price }원  / 충전일 : ${info.regdate }</li>
   </c:forEach>
</ul>
</div>
