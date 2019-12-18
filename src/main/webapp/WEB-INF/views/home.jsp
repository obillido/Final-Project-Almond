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
	      <a href="${path}/webcontents/episode/list?contnum=81">
	      <img src="${path}/resources/suhyeonimages/111.jpg" class="d-block w-100">
	      </a>
	      <div class="carousel-caption d-none d-md-block">
	        <h5>상큼달콤한 힐링 동거 로맨스</h5>
	        <p>우리집 우렁이는</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <a href="${path}/webcontents/episode/list?contnum=82">
	      <img src="${path}/resources/suhyeonimages/이벤트2.png" class="d-block w-100">
	      </a>
	      <div class="carousel-caption d-none d-md-block">
	        <h5>딸바보가 된 희대의 폭군</h5>
	        <p>황제의 외동딸</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <a href="${path}/webcontents/episode/list?contnum=83">
	      <img src="${path}/resources/suhyeonimages/제3.png" class="d-block w-100">
	      </a>
	      <div class="carousel-caption d-none d-md-block">
	        <h5>곧 죽을 건데 뭐 어때</h5>
	        <p>시녀의 유혹</p>
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
	 	오늘의 업데이트 <span class="badge badge-light">Up</span>
	</button>
	
	<br><br>
	
	<div class="row" id="upList">
	<c:forEach var="info" items="${list }">
	   <div class="card" style="width:16rem;"> 
	      <img src="${path}/resources/webcontents/${info.CULTYPE }/${info.IMG }" class="card-img-top"> 
	      <div class="card-body">
		     <h4 class="card-title" style="text-align:left;"><strong>${info.TITLE}</strong></h4>
		     
			 <a href="${path}/webcontents/episode/list?contnum=${info.CONTNUM}&cultype=${info.CULTYPE }" class="btn btn-outline-warning">보러가기</a>
			 
		  </div>
	   </div>
	</c:forEach>
	</div>
	
	<br><br>
	<hr style="border:0.6px solid lightgray;">
	
	<br>
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
   #jakpumList div{margin-left:20px;}
   #upList img{width:250px;height:200px;}
   #upList div{margin-left:20px;}
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
						      "<h4 class='card-title'><strong>" + $(this).find("title").text() + "</strong></h4>" + 
					          "<a href='${path}/webcontents/episode/list?contnum=" + $(this).find("contnum").text() + "&cultype=" + $(this).find("cultype").text() + "' class='btn btn-outline-warning'>보러가기</a>" + 
					          "</div></div>";
					   console.log(jp);
					   $("#jakpumList").append(jp);
				   });
			   }
		   });
	   });
   });
</script>
