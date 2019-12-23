<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>
</head>
<body>
<a href="${pageContext.request.contextPath }/event1">이벤트1</a>
<a href="${pageContext.request.contextPath }/event2?eventnum=5">이벤트2</a>
<a href="${pageContext.request.contextPath }/event3?eventnum=6&eventnum2=7">이벤트3</a>
<a href="${pageContext.request.contextPath }/event4?eventnum=10">이벤트4</a>
<a href="${pageContext.request.contextPath }/event5?eventnum=5&eventnum2=7">이벤트5</a>
<a href="${pageContext.request.contextPath }/event3list">이벤트3list</a>
<a href="${pageContext.request.contextPath }/event3reading">이벤트3reading</a>
<a href="${pageContext.request.contextPath }/test">룰렛테스트</a> 
</body>
</html>