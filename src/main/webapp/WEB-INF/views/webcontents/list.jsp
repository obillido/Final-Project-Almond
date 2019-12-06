<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">웹툰/만화</h1>

    <ol class="breadcrumb">
      <c:forEach var="genre" items="${genreList}">
        <li class="breadcrumb-item"><a href="${path}/webcontents/list?cultype=1&genre=${genre}">${genre }</a></li>
      </c:forEach>
    </ol>

    <div class="row">
      <c:forEach var="info" items="${list}">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100" onclick="location.href='${path}/webcontents/contents?contnum=${info.contnum}'">
          <a href="#"><img class="card-img-top" src="${path}/resources/webcontents/${cultype}/${info.img}"></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">${info.title }</a>
            </h4>
            <p class="card-text">${info.outline }</p>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>         
     


    <!-- Pagination -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">이전</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">다음</span>
        </a>
      </li>
    </ul>

  </div>
  <!-- /.container -->