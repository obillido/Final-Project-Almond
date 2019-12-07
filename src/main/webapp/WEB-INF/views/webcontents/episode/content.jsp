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








   <div class="row">
     <div class="col-lg-8" style="border:1px solid black;">
       <!-- Comments Form -->
       <div class="card my-4">
         <h5 class="card-header">독자님! 한마디 남겨주세요.</h5>
         <div class="card-body">
           <form method="post" action="${pageContext.request.contextPath}/webcontents/comments/regi">
             <input type="hidden" name="epinum" value="${epinum}">
             <div class="form-group">
               <textarea class="form-control" rows="3" name="content"></textarea>
             </div>
             <button type="submit" class="btn btn-primary">등록</button>
           </form>
         </div>
       </div>

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