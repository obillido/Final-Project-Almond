<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<h1>윤혁</h1>
<ul>	
	<li><a href='${pageContext.request.contextPath}/ticket/webtoon?usernum=${usernum}&contnum=${webc.contnum}&tknum=${webc.tknum}'>웹툰/만화 (이용권충전페이지)</a></li>		
	<li><a href='${pageContext.request.contextPath}/ticket/novel'>웹소설/장르 (이용권충전페이지)</a></li>	
	<li><a href='${pageContext.request.contextPath}/ticket/drama'>예능/드라마 (이용권충전페이지)</a></li>	
	<li><a href='${pageContext.request.contextPath}/ticket/movie'>영화 (이용권충전페이지)</a></li>	
</ul>
