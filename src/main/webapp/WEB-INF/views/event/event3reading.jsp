<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>event3reading</h1>
<c:forEach var="vo" items="${list }">
<p>
	당첨유저:${vo.usernum }
</p>
</c:forEach>
<br>
<a href="${pageContext.request.contextPath }/">홈으로</a>