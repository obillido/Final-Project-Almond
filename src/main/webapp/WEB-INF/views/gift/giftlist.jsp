<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="${pageContext.request.contextPath}/resources/gift/giftlist.css" rel="stylesheet">

<div class="wrap">
	<div class="d1">
		<div class="d2">
			<div class="choice1">
				<button type="button" class="btn btn-warning btn-lg">
				 	<span class="badge badge-light" style="font-size: 25px;">장르를 선택하세요.</span>
				</button>
			</div>
			<div class="choice2">
				<div class="btn-group btn-group-toggle" data-toggle="buttons" onclick="loadForm();">
				  <select name="cultype" class="btn btn-secondary">
				     <option value="1" selected="selected">만화</option>
				     <option value="2">소설</option>
				     <option value="3">예능</option>
				     <option value="4">드라마</option>
				     <option value="5">영화</option>
				  </select>
			  	</div>
			</div>
		</div>	
			<br>
			<br>
			<div id="jakpumList" class="row">
			</div>
			<br><br><br>
	</div>
</div>

<style>
   #jakpumList {width: 100%; padding-top: 80px;}
   #jakpumList img{width:250px;height:200px;}
   #jakpumList div{margin-left:20px;}
</style>

<script type="text/javascript">
   $(document).ready(function(){
	   loadForm();
	   //$("#div").click(loadForm(2));
   });
   function loadForm(){
	   $("#jakpumList").empty();
	   var cultype=document.getElementsByName("cultype")[0].value;
	   $.ajax({
		   url:"/almond/webcontents/jakpum?cultype=" + cultype,
		   dataType:"xml",
		   success:function(data){
			   $(data).find("jakpum").each(function(){
				   var jp="<div class='card' style='width:16rem;'>" + 
				          "<img src='/almond/resources/webcontents/" + $(this).find("cultype").text() + "/" + $(this).find("img").text() + "' class='card-img-top'>" + 
					      "<div class='card-body'>" + 
					      "<h6 class='card-title'>작품명 : <strong>" + $(this).find("title").text() + "</strong></h6>" + 
					      "<p class='card-text'>구독자수 : " + $(this).find("readernum").text() + "</p>" + 
				          "<p class='card-text'>장르 : " + $(this).find("genre").text() + "</p>" + 
				          "<a href='/almond/webcontents/episode/list?contnum=" + $(this).find("contnum").text() + "&cultype=" + $(this).find("cultype").text() + "' class='btn btn-outline-warning'>선물하기</a>" + 
				          "</div></div>";
				   console.log(jp);
				   $("#jakpumList").append(jp);
			   });
		   }
	   });
   }
</script>
