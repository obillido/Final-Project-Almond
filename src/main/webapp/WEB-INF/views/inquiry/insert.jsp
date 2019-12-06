<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:50px;   
      padding-bottom:50px;
      width:30%;
    }
</style>

<div id="container">
<form method="post" action="${path}/inquiry/insert">
   제목<br>
   <input type="text" name="title" class="form-control"><br>
   내용<br>
   <textarea rows="10" cols="100" name="content" class="form-control"></textarea><br>
   <input type="submit" value="등록" class="btn btn-sm btn-primary">
</form>
</div>