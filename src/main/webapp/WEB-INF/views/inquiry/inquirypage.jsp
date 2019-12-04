<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<style type="text/css">
    #container {
      width: 40%;
      margin: 0 auto;     
      padding-top: 50px;   
    }
   .table > thead {background-color: #b3c6ff;}
   .table > thead > tr > th {text-align: center;}
   .table > tbody > tr > td {text-align: center;}
    #write {
      text-align: right;
    }
</style>

<div id="container">
 
   <div id="write">
     <a href="${pageContext/request/contextPath }/inquiry/insert">글쓰기</a>
   </div>

	<table class="table table-striped table-bordered">
	   <thead>
	   <tr>
	      <th>글번호</th>
	      <th>작성자</th>
	      <th>제목</th>
	      <th>작성일</th>
	   </tr>
	   </thead>

	   <c:forEach var="vo" items="${list}">
	      <tbody>
	      <tr>
	         <td>${vo.num}</td>
	         <td>${vo.writer}</td>
	         <td><a href="${cp}/board/detail?num=${vo.num}">${vo.title}</a></td>
	         <td>${vo.regdate}</td>
	      </tr>
	      </tbody>
	   </c:forEach>

	</table>
</div>