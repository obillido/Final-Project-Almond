<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${code=='success' }">
		<h1>캐시 1000원 지급 완료!</h1>
	</c:when>
	<c:otherwise>
		<h1>아쉽게도 정답이 아닙니다.</h1>
	</c:otherwise>
</c:choose>
<a href="${pageContext.request.contextPath }/">홈으로</a>
</body>