<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!-- Page Content -->
<div class="container">

  <!-- Page Heading/Breadcrumbs -->
  <h1 class="mt-4 mb-3">Blog Home Two
    <small>Subheading</small>
  </h1>

  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href="index.html">Home</a>
    </li>
    <li class="breadcrumb-item active">Blog Home 2</li>
  </ol>

	<!-- Intro Content -->
  <div class="row">
    <div class="col-lg-6">
      <img class="img-fluid rounded mb-4" src="${path}/resources/webcontents/${contInfo.cultype}/${contInfo.img}">
    </div>
    <div class="col-lg-6">
      <h2>${contInfo.title}</h2>
      <br><br>
			<c:choose>
				<c:when test="${contInfo.cultype==1||contInfo.cultype==2}">
					<p>${contInfo.writer}</p>
					<p>${contInfo.illustrator}</p>
					<p>${contInfo.publisher}</p>
				</c:when>
				<c:otherwise>
					<p>${contInfo.director}</p>
					<p>${contInfo.actor}</p>
					<p>${contInfo.runtime}분</p>
					<p>개봉일 : ${contInfo.proddate}</p>
				</c:otherwise>
			</c:choose>
			<p><c:choose><c:when test="${contInfo.completiontype==0}">연재중</c:when><c:otherwise>완결</c:otherwise></c:choose></p>
			<a href="${path}/webcontents/episode/regi?cultype=${contInfo.cultype}&contnum=${contInfo.contnum}" class="btn btn-primary">회차 등록</a>
    	<br><br>
    </div>
  </div>
  <!-- /.row -->




  <div class="card h-100">
    <ul class="list-group list-group-flush">
      <li class="list-group-item">구독자수 전체댓글</li>
      <li class="list-group-item">공지사항</li>
      <li class="list-group-item">첫편부터 ${contInfo.waiting}편 무료</li>
      <li class="list-group-item">기다리면 무료</li>
    </ul>
  </div>




  <!-- Blog Post -->
  <div class="card mb-4">
    <div class="card-body">
      <div class="row">
        <div class="col-lg-6">
          <a href="#">
            <img class="img-fluid rounded" src="http://placehold.it/750x300" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <h2 class="card-title">Post Title</h2>
          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
          <a href="#" class="btn btn-primary">Read More &rarr;</a>
        </div>
      </div>
    </div>
    <div class="card-footer text-muted">
      Posted on January 1, 2017 by
      <a href="#">Start Bootstrap</a>
    </div>
  </div>

  <!-- Blog Post -->
  <div class="card mb-4">
    <div class="card-body">
      <div class="row">
        <div class="col-lg-6">
          <a href="#">
            <img class="img-fluid rounded" src="http://placehold.it/750x300" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <h2 class="card-title">Post Title</h2>
          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
          <a href="#" class="btn btn-primary">Read More &rarr;</a>
        </div>
      </div>
    </div>
    <div class="card-footer text-muted">
      Posted on January 1, 2017 by
      <a href="#">Start Bootstrap</a>
    </div>
  </div>

  <!-- Blog Post -->
  <div class="card mb-4">
    <div class="card-body">
      <div class="row">
        <div class="col-lg-6">
          <a href="#">
            <img class="img-fluid rounded" src="http://placehold.it/750x300" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <h2 class="card-title">Post Title</h2>
          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
          <a href="#" class="btn btn-primary">Read More &rarr;</a>
        </div>
      </div>
    </div>
    <div class="card-footer text-muted">
      Posted on January 1, 2017 by
      <a href="#">Start Bootstrap</a>
    </div>
  </div>

  <!-- Blog Post -->
  <div class="card mb-4">
    <div class="card-body">
      <div class="row">
        <div class="col-lg-6">
          <a href="#">
            <img class="img-fluid rounded" src="http://placehold.it/750x300" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <h2 class="card-title">Post Title</h2>
          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
          <a href="#" class="btn btn-primary">Read More &rarr;</a>
        </div>
      </div>
    </div>
    <div class="card-footer text-muted">
      Posted on January 1, 2017 by
      <a href="#">Start Bootstrap</a>
    </div>
  </div>

  <!-- Pagination -->
  <ul class="pagination justify-content-center mb-4">
    <li class="page-item">
      <a class="page-link" href="#">&larr; Older</a>
    </li>
    <li class="page-item disabled">
      <a class="page-link" href="#">Newer &rarr;</a>
    </li>
  </ul>

</div>
