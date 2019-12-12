<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:250px;   
      padding-bottom:250px;
      width:30%;
    }
    #submit{margin-left:500px;}
</style>

<div id="container" class="form-group">
<form method="post" action="${path}/inquiry/insert">

   <span class="badge badge-light" style="font-size:1.2em"><strong>제목</strong></span><br>
   <input type="text" name="title" class="form-control"><br>
   <span class="badge badge-light" style="font-size:1.2em"><strong>내용</strong></span><br>
   <textarea rows="10" cols="100" name="content" class="form-control"></textarea><br>
   <input type="submit" value="등록" class="btn btn-md btn-default" id="submit" style="font-weight:600;">
</form>
</div>