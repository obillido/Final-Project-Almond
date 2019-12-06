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
    제목<br>
   <input type="text" value="${vo.title }" class="form-control"><br>
    내용<br>
   <input type="text" value="${vo.content }" class="form-control">
</div>