<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    #container {
      width: 40%;
      margin: 0 auto;     
      padding-top: 50px;   
    }
    #paging{text-align:center;}
   .table > thead {background-color: #FADCA5;}
   .table > thead > tr > th {text-align: center;}
   .table > tbody > tr > td {text-align: center;}
    #write {
      text-align: right;
    }
</style>

<div id="container">
   <div id="write">
     <a href="${path }/inquiry/insert">글쓰기</a>
   </div>

	<table class="table table-striped table-bordered">
	   <thead>
	   <tr>
	      <th>글번호</th>
	      <th>제목</th>
	      <th>내용</th>
	   </tr>
	   </thead>

	   <c:forEach var="info" items="${list}">
	      <tbody>
	      <tr>
	         <td>${info.inqnum}</td>
	         <td><a href="${path }/inquiry/detail?inqnum=${info.inqnum}">${info.title}</a></td>
	         <td>${info.content}</td>
	      </tr>
	      </tbody>
	   </c:forEach>
	</table>
	
	
<!-- 페이징 처리 -->
<div id="paging">
   <ul class="pagination justify-content-center">
   <c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
      <c:choose>
         <c:when test="${i==pu.pageNum}"><!-- 현재 페이지인 경우 -->
            <li class="page-item">
            <a class="page-link" href="${path}/inquiry/inquirypage?pageNum=${i}&usernum=${usernum}">${i}</a>
            </li>
         </c:when>
         <c:otherwise>
            <li class="page-item">
            <a class="page-link" href="${path}/inquiry/inquirypage?pageNum=${i}&usernum=${usernum}">${i}</a>
            </li>
         </c:otherwise>
      </c:choose>
   </c:forEach>
   </ul>
</div>


</div>