<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:200px;   
      padding-bottom:200px;
      width:50%;
    }
    #paging{text-align:center;}
  
   .table > thead > tr > th {text-align: center;font-weight:600;font-size:1.1em;}
   .table > tbody > tr > td {text-align: center;color:black;}
    #write {
      text-align: right;
    }
    #paging ul li a{color:gray;font-weight:900;}
    
</style>

<div id="container">
<div class="card">
<br>
   <div id="write" class="container">
     <a href="${path }/inquiry/insert" class="btn btn-default">글쓰기</a>
   </div>
<br>
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
	   <c:if test="${info.lev ne 1 }">
	      <tbody>
	      <tr class="info">
	         <td>${info.inqnum}</td>
	         <td><a href="${path }/inquiry/detail?inqnum=${info.inqnum}&ref=${info.ref}&usernum=${info.usernum}" id="a">${info.title}</a></td>
	         <td>${info.content}</td>
	         <td>
	         <c:if test="${info.status=='0' }">
	         <span style="color:red">X</span>
	         </c:if>
	         <c:if test="${info.status=='1' }">
	         <span style="color:blue">O</span>
	         </c:if>
	         </td>
	      </tr>
	      </tbody>
	   </c:if>
	   </c:forEach>
	
	</table>

	
<!-- 페이징 처리 -->
<div id="paging">
   <ul class="pagination justify-content-center">
   <c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
      <c:choose>
         <c:when test="${i==pu.pageNum}"><!-- 현재 페이지인 경우 -->
            <li class="page-item">
            <a class="page-link" href="${path}/inquiry/inquirypage?pageNum=${i}">${i}</a>
            </li>
         </c:when>
         <c:otherwise>
            <li class="page-item">
            <a class="page-link" href="${path}/inquiry/inquirypage?pageNum=${i}">${i}</a>
            </li>
         </c:otherwise>
      </c:choose>
   </c:forEach>
   </ul>
</div>
</div>	

</div>