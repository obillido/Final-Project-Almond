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
	<form class="was-validated" method="post" action="${path }/notice/insert">
	  <div class="mb-3">
	    <input type="hidden" value="${contnum }" name="contnum">
        <label for="t">제목</label>
        <input type="text" class="form-control is-valid" id="t" name="title">
	    <br>
	    <label for="c">내용</label>
	    <textarea class="form-control is-invalid" rows="5" cols="50" id="c" name="content"></textarea>
	    <br>
	    <div class="invalid-feedback">
	      체크표시는 모두 필수 입력사항입니다.
	    </div>
	    <br>
	    <button type="submit" class="btn btn-success" style="margin-left:700px;">등록</button>
	  </div>
	</form>
</div>