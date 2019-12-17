<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<h1>윤혁</h1>
<ul>	
	<li><a href='${pageContext.request.contextPath}/ticket/webtoon?contnum=${webc.contnum}'>웹툰/만화 (이용권충전페이지)</a></li>		
	<li><a href='${pageContext.request.contextPath}/ticket/novel?contnum=${webc.contnum}'>웹소설/장르 (이용권충전페이지)</a></li>	
	<li><a href='${pageContext.request.contextPath}/ticket/drama?contnum=${webc.contnum}'>예능/드라마 (이용권충전페이지)</a></li>	
	<li><a href='${pageContext.request.contextPath}/ticket/movie?contnum=${webc.contnum}'>영화 (이용권충전페이지)</a></li>	
	<li><a href='${pageContext.request.contextPath}/gift/gift'>관리자 선물등록</a></li>
</ul>