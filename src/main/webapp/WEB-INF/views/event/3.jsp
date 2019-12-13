<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">이벤트3
      <small>열람이벤트2</small>
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Portfolio Item</li>
    </ol>
    <!-- Portfolio Item Row -->
    <div class="row">
      <div class="col-md-7">
        <img style="width: 90%;" class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/달빛조각사.jpg" alt="">
      </div>
      <div class="col-md-5">
        <h3 class="my-3">Project Description</h3>
        <p>이벤트기간 : 12월 8일(일)~12월15일(월)<br>
			당첨자 발표 및 캐시뽑기권 지급 : 12월 16일(화)<br>
			(개별 안내)<br></p>
        <h3 class="my-3">Project Details</h3>
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventTK/6.jpg">
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventTK/5.jpg">
      </div>
    </div>
    <!-- Related Projects Row -->
    <h3 class="my-4">이벤트작품 보러가기</h3>
 		<div class="row">
      		<div class="col-md-3 col-sm-4 mb-4">
	       		<a href="#">
	         		 <img class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/달빛조각사.jpg" alt="">
	        	</a>
      		</div>
      		
      		<div class="col-md-8 col-sm-4 mb-4">     
		        <div id="content">
		        	<ul>
		          		<li style="list-style:none;">
		          		<br>
		          		달빛조각사[독점연재]<br>
		          		<br>
		          		몇명이 보는지 / 판타지소설 / 남희성 <br>
		          		<br>
		          		업데이트날짜
		          		</li>
		        	</ul>
		        </div>
      		</div>
		</div>
  </div>
  <!-- /.container -->

