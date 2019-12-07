<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <c:choose>
       <c:when test="${cultype==1 }">
          <h1 class="mt-4 mb-3">만화</h1>
       </c:when>
       <c:when test="${cultype==2 }">
          <h1 class="mt-4 mb-3">소설</h1>
       </c:when>
       <c:when test="${cultype==3 }">
          <h1 class="mt-4 mb-3">예능</h1>
       </c:when>
       <c:when test="${cultype==4 }">
          <h1 class="mt-4 mb-3">드라마</h1>
       </c:when>
       <c:when test="${cultype==5 }">
          <h1 class="mt-4 mb-3">영화</h1>
       </c:when>
    </c:choose>
    

    <ol class="breadcrumb">
      <c:forEach var="genre" items="${genreList}">
        <li class="breadcrumb-item"><a href="${path}/webcontents/list?cultype=${cultype }&genre=${genre}">${genre }</a></li>
      </c:forEach>
    </ol>
	
    
    <div style="width:70px;">
    <c:if test="${cultype==1}">
    <form method="post" action="${path}/webcontents/listonday">
    <select name="dayofweek" class="form-control">
         <option value="월요일"
         <c:if test="${dayofweek=='월요일'}">selected</c:if>>월</option>
         <option value="화요일"
         <c:if test="${dayofweek=='화요일'}">selected</c:if>>화</option>
         <option value="수요일"
         <c:if test="${dayofweek=='수요일'}">selected</c:if>>수</option>
         <option value="목요일"
         <c:if test="${dayofweek=='목요일'}">selected</c:if>>목</option>
         <option value="금요일"
         <c:if test="${dayofweek=='금요일'}">selected</c:if>>금</option>
         <option value="토요일"
         <c:if test="${dayofweek=='토요일'}">selected</c:if>>토</option>
         <option value="일요일"
         <c:if test="${dayofweek=='일요일'}">selected</c:if>>일</option>
    </select>
    <input type="submit" value="요일별 검색" class="btn btn-sm btn-primary">
    </form>
    </c:if>
    </div>
    <br><br>
    
    <div class="row">
      <c:forEach var="dayinfo" items="${daylist}">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100" onclick="location.href='${path}/webcontents/episode/list?contnum=${dayinfo.contnum}&cultype=${cultype}'">
          <a href="#"><img class="card-img-top" src="${path}/resources/webcontents/${cultype}/${dayinfo.img}" height="300px"></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">${dayinfo.title }</a>
            </h4>
            <p class="card-text">${dayinfo.outline }</p>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>      
    
    
    
    <div class="row">
      <c:forEach var="info" items="${list}">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100" onclick="location.href='${path}/webcontents/episode/list?contnum=${info.contnum}&cultype=${cultype}'">
          <a href="#"><img class="card-img-top" src="${path}/resources/webcontents/${cultype}/${info.img}" height="300px"></a>
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
     
  </div>
