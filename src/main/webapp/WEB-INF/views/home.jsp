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
      <img src="${path}/resources/suhyeonimages/이벤트1.jpg" class="d-block w-100">
      <div class="carousel-caption d-none d-md-block">
        <h5>Event</h5>
        <p>1</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="${path}/resources/suhyeonimages/이벤트2.jpg" class="d-block w-100">
      <div class="carousel-caption d-none d-md-block">
        <h5>Event</h5>
        <p>2</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="${path}/resources/suhyeonimages/이벤트3.jpg" class="d-block w-100">
      <div class="carousel-caption d-none d-md-block">
        <h5>Event</h5>
        <p>3</p>
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


<button type="button" class="btn btn-warning btn-lg">
  인기 에피소드 <span class="badge badge-light">Top 4</span>
</button>
<br><br>
<div class="row">
<c:forEach var="info" items="${list}">
  <div class="card" style="width: 16rem;">
    <div class="card-body">
      <h5 class="card-title">누적 조회수 : <strong>${info.HIT }</strong></h5>
      <p class="card-text">회차 제목 : <strong>${info.SUBTITLE }</strong></p>
      <a href="${path}/webcontents/episode/content?contnum=${info.CONTNUM}&epinum=${info.EPINUM}" class="btn btn-danger">보러가기</a>
    </div>
  </div>  
</c:forEach>
</div>
<br><br>
<div class="progress">
  <div class="progress-bar progress-bar-striped bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<br><br>
<button type="button" class="btn btn-warning btn-lg">
 인기 작품 <span class="badge badge-light">장르별</span>
</button>

<div class="btn-group btn-group-toggle" data-toggle="buttons" id="div">
  <select name="cultype" class="btn btn-secondary">
     <option value="1">만화</option>
     <option value="2">소설</option>
     <option value="3">예능</option>
     <option value="4">드라마</option>
     <option value="5">영화</option>
  </select>
</div>
<br>
<br>
<div id="jakpumList" class="row">
</div>


<br><br><br>
</div>

<style>
   #jakpumList img{width:250px;height:200px;}
   #jakpumList div{margin-right:20px;}
</style>

<script type="text/javascript">
   $(document).ready(function(){
	   $("#div").click(function(){
		   $("#jakpumList").empty();
		   var cultype=document.getElementsByName("cultype")[0].value;
		   $.ajax({
			   url:"${path}/webcontents/jakpum?cultype=" + cultype,
			   dataType:"xml",
			   success:function(data){
				   $(data).find("jakpum").each(function(){
					   var jp="<div class='card' style='width:16rem;'>" + 
					          "<img src='${path}/resources/webcontents/" + $(this).find("cultype").text() + "/" + $(this).find("img").text() + "' class='card-img-top'>" + 
						      "<div class='card-body'>" + 
						      "<h5 class='card-title'>작품명 : " + $(this).find("title").text() + "</h5>" + 
						      "<p class='card-text'>구독자수 : " + $(this).find("readernum").text() + "</p>" + 
					          "<p class='card-text'>장르 : " + $(this).find("genre").text() + "</p>" + 
					          "<a href='' class='btn btn-danger'>보러가기</a>" + 
					          "</div></div>";
					   console.log(jp);
					   $("#jakpumList").append(jp);
				   });
			   }
		   });
	   });
   });
</script>
