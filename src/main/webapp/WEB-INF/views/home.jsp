<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>


<div class="container">

	<ul>
		<li><a href='${pageContext.request.contextPath}/2'>2.소희</a></li>
		<li><a href='${pageContext.request.contextPath}/3'>3.윤하</a></li>
		<li><a href='${pageContext.request.contextPath}/4'>4.병윤</a></li>
		<li><a href='${pageContext.request.contextPath}/5'>5.윤혁</a></li>
	</ul>






<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${path}/resources/suhyeonimages/salgu.JPG" class="d-block w-100">
      <div class="carousel-caption d-none d-md-block">
        <h5>1</h5>
        <p>김</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="${path}/resources/suhyeonimages/salgu.JPG" class="d-block w-100">
      <div class="carousel-caption d-none d-md-block">
        <h5>2</h5>
        <p>살</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="${path}/resources/suhyeonimages/salgu.JPG" class="d-block w-100">
      <div class="carousel-caption d-none d-md-block">
        <h5>3</h5>
        <p>구</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br><br>

</div>

