<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:250px;   
      padding-bottom:250px;
      width:30%;
    }
    #write {
      text-align: right;
    }
</style>

<div id="container">

   <span class="badge badge-light" style="font-size:1.2em"><strong>제목</strong></span><br>
   <input type="text" value="${vo.title }" class="form-control" readonly="readonly"><br>
   <span class="badge badge-light" style="font-size:1.2em"><strong>내용</strong></span><br>
   <input type="text" value="${vo.content }" class="form-control" readonly="readonly">
<br>
<input type="button" class="btn btn-md btn-default" id="write" value="답변 달기">
<br>
<div id="writeForm" style="display:none">
  
   <input type="text" id="replyTitle" class="form-control" value="안녕하십니까, 아몬드페이지입니다."><br>
   
   <textarea rows="10" cols="100" id="replyContent" class="form-control"></textarea><br>
   <input type="submit" value="답변 등록" class="btn btn-md btn-default" id="submitReply" style="font-weight:600;">
</div>

<hr class="my-4">
<br>
<div class="pos-f-t">
  <div class="collapse" id="navbarToggleExternalContent">
    <div class="bg-light p-4">
      <h5 class="text-black h5" id="no1">${vo2.title }</h5>
      <span class="text-muted" id="no2">${vo2.content }</span>
    </div>
  </div>
  <nav class="navbar navbar-dark bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon" style="background-color:black;"></span>   <h8 style="color:black;">답변 보기</h8> 
    </button>
  </nav>
</div>
</div>


<script type="text/javascript">
   $(document).ready(function(){
	   $("#write").click(function(){
		   $("#writeForm").fadeIn("slow",function(){
		   });	   
	   });
	   
	   $("#submitReply").click(function(){
		   var replyContent=document.getElementById("replyContent").value;
		   var replyTitle=document.getElementById("replyTitle").value;
		   $.ajax({
			   url:"${path}/inquiry/reply?content=" + replyContent + "&title=" + replyTitle + "&ref=${vo.ref}&guestnum=${vo.usernum}",
			   dataType:"xml",
			   success:function(data){
				   var title=$(data).find("title").text();
				   var content=$(data).find("content").text();
				   $("#no1").append(title);
				   $("#no2").append(content);
				   alert("답변 등록이 완료되었습니다.");
				   $("#writeForm").fadeOut();
			   }
		   }); 
	   });
   });
</script>