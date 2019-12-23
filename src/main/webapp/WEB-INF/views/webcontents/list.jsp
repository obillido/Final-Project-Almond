<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
   h1 em{color:#FF895A;}
   #cate{background-color:#FDE1B4;border:3px double #EA9A56;}
   #cate li a{color:black;}
   a{color:black;text-decoration:none;}
   a:link{color: black; text-decoration: none;}
   a:visited{color: black; text-decoration: none;}
   a:hover{color: black; text-decoration: none;}
</style>

<script type="text/javascript">
   $(document).ready(function(){
	   $("#dw").change(function(){
		   $("#listbyday").empty();
		   $("#original").empty();
		   $("#bySearch").empty();
		   var dayofweek=document.getElementsByName("dayofweek")[0].value;
		   $.ajax({
			   url:"${path}/webcontents/listonday?dayofweek=" + dayofweek,
			   dataType:"xml",
			   success:function(data){
				
				   $(data).find("result").each(function(){
					   var contnum=$(this).find("contnum").text();
					   var title=$(this).find("title").text();
					   var outline=$(this).find("outline").text();
					   var img=$(this).find("img").text();
					   var genre=$(this).find("genre").text();
					   var rs="<div class='col-lg-4 col-sm-6 portfolio-item'>" +
				              "<a href='${path}/webcontents/episode/list?contnum=" + contnum + "'><div class='card h-100'>" +
				              "<img class='card-img-top' src='${path}/resources/webcontents/1/" + img + "' height='300px'>" +
				              "<div class='card-body'>" +
				              "<h5 class='card-title'><strong><mark>" + title + "</mark></strong></h5>" + 
				              "</div></div></a></div>";
				      
					   $("#listbyday").append(rs);
				   });
			   }
		   });
	   });
	      
	  
	 
	   $("#sc").click(function(){
		   $("#listbyday").empty();
		   $("#original").empty();
		   $("#bySearch").empty();
		   var searchCategory=document.getElementsByName("searchCategory")[0].value;
		   if(searchCategory=='구독자순'){
			   $.ajax({
				   url:"${path}/webcontents/byReadernum?cultype=${cultype}",
				   dataType:"xml",
				   success:function(data){
					   $(data).find("result").each(function(){
						   var cultype=$(this).find("cultype").text();
						   var contnum=$(this).find("contnum").text();
						   var title=$(this).find("title").text(); 
						   var img=$(this).find("img").text();
						   var readernum=$(this).find("readernum").text();
					  
						   var rs="<div class='col-lg-4 col-sm-6 portfolio-item'>" +
					              "<a href='${path}/webcontents/episode/list?contnum=" + contnum + "'><div class='card h-100'>" +
					              "<img class='card-img-top' src='${path}/resources/webcontents/" + cultype + "/"  + img + "' height='300px'>" +
					              "<div class='card-body'>" +
					              "<h5 class='card-title'><strong><mark>" + title + "</mark></strong></h5>" + 
					              "<p class='card-text'>구독자수 : " + readernum + " 명</p>" +
					              "</div></div></a></div>";
						   $("#bySearch").append(rs);
					   });
				   }
			   });
		   }else if(searchCategory=='조회순'){
			   $.ajax({
				   url:"${path}/webcontents/byHit?cultype=${cultype}",
				   dataType:"xml",
				   success:function(data){
					   $(data).find("result").each(function(){
						   var cultype=$(this).find("cultype").text();
						   var contnum=$(this).find("contnum").text();
						   var title=$(this).find("title").text();
						   var outline=$(this).find("outline").text();
						   var img=$(this).find("img").text();
						   var genre=$(this).find("genre").text();
						   var tot=$(this).find("tot").text();
					  
						   var rs="<div class='col-lg-4 col-sm-6 portfolio-item'>" +
					              "<a href='${path}/webcontents/episode/list?contnum=" + contnum + "'><div class='card h-100'>" +
					              "<img class='card-img-top' src='${path}/resources/webcontents/" + cultype + "/"  + img + "' height='300px'>" +
					              "<div class='card-body'>" +
					              "<h5 class='card-title'><strong><mark>" + title + "</mark></strong></h5>" + 
					              "<p class='card-text'>조회수 : " + tot + " hits</p>" +
					              "</div></div></a></div>";
						   $("#bySearch").append(rs);
					   });
				   }
			   });
		   }else if(searchCategory=='댓글좋아요순'){
			   $.ajax({
				   url:"${path}/webcontents/byLikes?cultype=${cultype}",
				   dataType:"xml",
				   success:function(data){
					   $(data).find("result").each(function(){
						   var cultype=$(this).find("cultype").text();
						   var contnum=$(this).find("contnum").text();
						   var title=$(this).find("title").text();
						   var img=$(this).find("img").text();
						   var cnt=$(this).find("cnt").text();
						 
						   var rs="<div class='col-lg-4 col-sm-6 portfolio-item'>" +
					              "<a href='${path}/webcontents/episode/list?contnum=" + contnum + "'><div class='card h-100'>" +
					              "<img class='card-img-top' src='${path}/resources/webcontents/" + cultype + "/"  + img + "' height='300px'>" +
					              "<div class='card-body'>" +
					              "<h5 class='card-title'><strong><mark>" + title + "</mark></strong></h5>" + 
					              "<p class='card-text'>댓글 좋아요수 : " + cnt + " 개</p>" +
					              "</div></div></a></div>";
						   $("#bySearch").append(rs);
					   });
				   }
			   });
		   }else if(searchCategory=='별점순'){
			   $.ajax({
				   url:"${path}/webcontents/byScore?cultype=${cultype}",
				   dataType:"xml",
				   success:function(data){
					   $(data).find("result").each(function(){
						   var cultype=$(this).find("cultype").text();
						   var contnum=$(this).find("contnum").text();
						   var title=$(this).find("title").text();
						   var img=$(this).find("img").text();
						   var score=$(this).find("score").text();
						 
						   var rs="<div class='col-lg-4 col-sm-6 portfolio-item'>" +
					              "<a href='${path}/webcontents/episode/list?contnum=" + contnum + "'><div class='card h-100'>" +
					              "<img class='card-img-top' src='${path}/resources/webcontents/" + cultype + "/"  + img + "' height='300px'>" +
					              "<div class='card-body'>" +
					              "<h5 class='card-title'><strong><mark>" + title + "</mark></strong></h5>" + 
					              "<p class='card-text'>별점 : " + score + "</p>" +
					              "</div></div></a></div>";
						   $("#bySearch").append(rs);
					   });
				   }
			   });
		   }
	   });
   });
</script>

  <div class="container">
    <br>
    <c:choose>
       <c:when test="${cultype==1 }">
          <h1 class="mt-4 mb-3"><strong>만화</strong> <small><em>webtoon</em></small></h1>
       </c:when>
       <c:when test="${cultype==2 }">
          <h1 class="mt-4 mb-3"><strong>소설</strong> <small><em>novel</em></small></h1>
       </c:when>
       <c:when test="${cultype==3 }">
          <h1 class="mt-4 mb-3"><strong>예능</strong> <small><em>show</em></small></h1>
       </c:when>
       <c:when test="${cultype==4 }">
          <h1 class="mt-4 mb-3"><strong>드라마</strong> <small><em>drama</em></small></h1>
       </c:when>
       <c:when test="${cultype==5 }">
          <h1 class="mt-4 mb-3"><strong>영화</strong> <small><em>movie</em></small></h1>
       </c:when>
    </c:choose>
    

    <ol class="breadcrumb" id="cate">
      <c:forEach var="genre" items="${genreList}">
        <li class="breadcrumb-item"><a href="${path}/webcontents/list?cultype=${cultype }&genre=${genre}"><strong>${genre }</strong></a></li>
      </c:forEach>
    </ol>
	
    <div id="wrap" class="row" style="padding-left:15px;">

    <div id="div2" style="width:150px;">
    <select name="searchCategory" class="form-control" id="sc">
         <option value="조회순">조회순</option>
         <option value="구독자순">구독자순</option>
         <option value="댓글좋아요순">댓글좋아요순</option>
         <option value="별점순">별점순</option>
    </select>    
    </div>
    
        <div id="div" style="width:70px;">
    <c:if test="${cultype==1}">

 
    <select name="dayofweek" class="form-control" id="dw">
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

    </c:if>
    </div>
    
    </div>
    
    
    
    <br><br>
    
    <div id="listbyday" class="row"></div>      
    <div id="bySearch" class="row"></div>
    
    
    <div class="row" id="original">
      <c:forEach var="info" items="${list}">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100" onclick="location.href='${path}/webcontents/episode/list?contnum=${info.contnum}'">
          <img class="card-img-top" src="${path}/resources/webcontents/${cultype}/${info.img}" height="300px">
          <div class="card-body">
            <h5 class="card-title">
              <strong><mark>${info.title }</mark></strong>
            </h5>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>         
  <br><br>
  </div>
  
  
