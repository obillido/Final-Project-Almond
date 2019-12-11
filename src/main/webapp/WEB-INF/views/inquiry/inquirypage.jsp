<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:100px;   
      padding-bottom:100px;
      width:50%;
    }
    #paging{text-align:center;}
   .table > thead {background-color: #FFBC9B;}
   .table > thead > tr > th {text-align: center;color:black;font-weight:900;font-size:1.2em;}
   .table > tbody > tr > td {text-align: center;color:black;}
    #write {
      text-align: right;
    }
    #paging ul li a{color:#FF8200;font-weight:900;}
    
</style>

<div id="container">
<div class="card">
<br>
   <div id="write" class="container">
     <a href="${path }/inquiry/insert"><span class="badge badge-warning" style="font-size:1.2em">글쓰기</span></a>
   </div>

	<table class="table table-striped table-bordered table-hover">
	   <thead>
	   <tr>
	      <th>글번호</th>
	      <th>제목</th>
	      <th>내용</th>
	      <th>답변여부</th>
	   </tr>
	   </thead>

	   <c:forEach var="info" items="${list}">
	      <tbody>
	      <tr>
	         <td>${info.inqnum}</td>
	         <td><a href="${path }/inquiry/detail?inqnum=${info.inqnum}" id="a">${info.title}</a></td>
	         <td>${info.content}</td>
	         <td>답변여부</td>
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

</div>