<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form method="post" action="${pageContext/request/contextPath }/inquiry/insert">
   제목<br>
   <input type="text" name="title"><br>
   내용<br>
   <textarea rows="5" cols="50" name="content"></textarea><br>
   <input type="submit" value="등록">
</form>