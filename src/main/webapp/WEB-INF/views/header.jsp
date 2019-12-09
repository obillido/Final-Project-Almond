<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" style="background-color:darkorange !important">
  <div class="container">
    <a class="navbar-brand" href="${path}/"><img src="${path}/resources/suhyeonimages/logo.JPG"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="${path}/webcontents/list?cultype=1" style="color:black !important">만화</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/webcontents/list?cultype=2" style="color:black !important">소설</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/webcontents/list?cultype=3" style="color:black !important">예능</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/webcontents/list?cultype=4" style="color:black !important">드라마</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/webcontents/list?cultype=5" style="color:black !important">영화</a>
        </li>
   
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black !important">
                  마이페이지
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
            <a class="dropdown-item" href="${path}/cash/charge?usernum=${usernum}">캐시 충전</a>
            <a class="dropdown-item" href="${path}/cash/list?usernum=${usernum}">캐시 내역</a>
            <a class="dropdown-item" href="#">보관함</a>
            <a class="dropdown-item" href="#">이용권 내역</a>
            <a class="dropdown-item" href="#">이벤트/쿠폰</a>
            <a class="dropdown-item" href="${path}/inquiry/inquirypage?usernum=${usernum}">1:1문의</a>
            <a class="dropdown-item" href="#">로그아웃</a>
          </div>
        </li>          
      </ul>
    </div>      
 
 

     <!-- Search Widget -->
     <div class="card-body">
       <div class="input-group">
         <input type="text" class="form-control" placeholder="아직 검색 안됨">
         <span class="input-group-btn">
           <button class="btn btn-secondary" type="button" style="background-color:red; margin-left:5px;">검색</button>
         </span>
       </div>
     </div>

  </div>
  
</nav>