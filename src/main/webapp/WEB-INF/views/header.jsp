<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath }/a"><img src="${pageContext.request.contextPath }/resources/suhyeonimages/logo.JPG"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/webtoon/webtoonpage">웹툰/만화</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">웹소설/장르</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">예능/드라마</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">영화</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">책</a>
          </li>
     
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    마이페이지
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="#">내 캐시</a>
              <a class="dropdown-item" href="#">캐시 충전</a>
              <a class="dropdown-item" href="#">보관함</a>
              <a class="dropdown-item" href="#">캐시 내역</a>
              <a class="dropdown-item" href="#">이용권 내역</a>
              <a class="dropdown-item" href="#">포인트 내역</a>
              <a class="dropdown-item" href="#">이벤트/쿠폰</a>
              <a class="dropdown-item" href="#">로그아웃</a>
            </div>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>