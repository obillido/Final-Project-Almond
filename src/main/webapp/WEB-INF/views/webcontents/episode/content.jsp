<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!-- Page Content -->
 <div class="container">

<br>
	<ol class="breadcrumb">
	  <li class="breadcrumb-item active">
	   <c:choose>
				<c:when test="${wvo.cultype==1}">만화</c:when>
				<c:when test="${wvo.cultype==2}">소설</c:when>
				<c:when test="${wvo.cultype==3}">예능</c:when>
				<c:when test="${wvo.cultype==4}">드라마</c:when>
				<c:when test="${wvo.cultype==5}">영화</c:when>
			</c:choose>
		</li>
	  <li class="breadcrumb-item active">${wvo.title}</li>
	  <li class="breadcrumb-item active">${evo.subtitle}</li>
	</ol>
	
	
	
	
	<div style="text-align:center">
		<img src="${path}/resources/webcontents/${wvo.cultype}/${evo.img}">
  </div>



	<hr>

	
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#commInsert").click(function(){
				var content=$("#content").val();
				var ref=0;
				$.ajax({
					url:"${path}/webcontents/comments/insert",
					dataType:"xml",
					type:"post",
					data:{"epinum":${evo.epinum},"usernum":${usernum},"content":content,"ref":ref},
					success:function(data){
						if($(data).find("code").text()=='success'){
	
							$("#content").val("");
							alert("댓글작성 완료");
						}else{
							alert("댓글작성 실패");
						}
					}
				});
			});
			function list(){
				$.ajax({
					url:"${path}/webcontents/comments/list?epinum=${evo.epinum}",
					dataType:"xml",
					success:function(data){
						$("#commList div").remove();
						$(data).find("comments").each(function(){
							var comm=
								'<div class="media mb-4">'+
					        '<img class="d-flex mr-3 rounded-circle" src="">'+
					        '<div class="media-body">'+
					          '<h5 class="mt-0">'+$(this).find("usernum").text()+'</h5>'+
										$(this).find("content").text()+
					        '</div>'+
					      '</div>'
							$("#commList").append(comm);
						});
					}
				});
			}
		});
	</script>
	

	<div class="row">
    <div class="col-lg-8">
      <!-- Comments Form -->
      
      <div class="card my-4">
        <h5 class="card-header">독자님! 한마디 남겨주세요.</h5>
        <div class="card-body">
          <div class="form-group">
            <textarea class="form-control" rows="3" id="content"></textarea>
          </div>
          <button id="commInsert" class="btn btn-primary">등록</button>
        </div>
      </div>



			<div id="commList">
			
	      <!-- Single Comment -->
	      <div class="media mb-4">
	        <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	        <div class="media-body">
	          <h5 class="mt-0">Commenter Name</h5>
						댓글내용
	        </div>
	      </div>
	
	      <!-- Comment with nested comments -->
	      <div class="media mb-4">
	        <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	        <div class="media-body">
	        
	          <h5 class="mt-0">Commenter Name</h5>
						댓글내용
	
	          <div class="media mt-4">
	            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	            <div class="media-body">
	              <h5 class="mt-0">Commenter Name</h5>
								댓글내용
	            </div>
	          </div>
	
	          <div class="media mt-4">
	            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	            <div class="media-body">
	              <h5 class="mt-0">Commenter Name</h5>
	            	댓글내용
	            </div>
	          </div>
					</div>
        </div>
        
      </div>
	  </div>
	</div>
	
	


</div>