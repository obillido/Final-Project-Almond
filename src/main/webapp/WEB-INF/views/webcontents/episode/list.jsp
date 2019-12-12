<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
	.freemark{
		background-color:red;
		color:white;
		display:inline-block;
		padding:2px;
		width:50px;
		text-align:center;
		border-radius:5px;
	}
	.ticketuse{
		width:300px;
		padding-top:10px;
		margin-top:700px;
		margin-left:100px;
		background-color:black; color:white;
		border-radius:10px;
	}
</style>

<script type="text/javascript">
	window.onload=function(){
		if(${msg!=null}){
			alert(${msg});
		}
	}
	function openEpisode(contnum,epinum,epnum,freenum,rt,type,status){
		if(epnum<=freenum || ${wvo.waiting==0}){
			post_to_url(["contnum","epinum","type"],[contnum,epinum,3]);
		}else if(status==1){ //티켓 사용해서 보기
			$("#ticketModal").modal("hide");
			if(type==2){
				$("#rentalTicketUseModal").modal();
				setTimeout('$("#rentalTicketUseModal").modal("hide");',1000);
			}
			else{
				$("#ownTicketUseModal").modal();
				setTimeout('$("#ownTicketUseModal").modal("hide");',1000);
			}
			setTimeout('post_to_url(["contnum","epinum","type"],['+contnum+','+epinum+','+type+'])',1000);
		}else if(type==1 || (type==2 && rt<3*24 && rt>0)){ //이전에 티켓을 사용한 경우
			post_to_url(["contnum","epinum"],[contnum,epinum]);
		}else{
			if(${usernum==null}){
				alter("로그인이 필요한 서비스입니다.");
			}else{
				$("#ticketModal").modal();
			}
		}
	}
	
	function post_to_url(names,params){
		var form = document.createElement("form");
		form.setAttribute("method","post");
		form.setAttribute("action","${path}/webcontents/episode/content");
		for(var key in params){
			var hiddenField=document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name",names[key]);
			hiddenField.setAttribute("value",params[key]);
			form.appendChild(hiddenField);
		}
		document.body.appendChild(form);
		form.submit();
	}
</script>





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
  </ol>

	<!-- Intro Content -->
  <div class="row">
    <div class="col-lg-6">
      <img class="img-fluid rounded mb-4" src="${path}/resources/webcontents/${wvo.cultype}/${wvo.img}" style="width:550px; height:600px;">
    </div>
    <div class="col-lg-6">
      <h2>${wvo.title}</h2>
      <br><br>
			<c:choose>
				<c:when test="${wvo.cultype==1||wvo.cultype==2}">
					<p>${wvo.writer}</p>
					<p>${wvo.illustrator}</p>
					<p>${wvo.publisher}</p>
				</c:when>
				<c:otherwise>
					<p>${wvo.director}</p>
					<p>${wvo.actor}</p>
					<p>${wvo.runtime}분</p>
					<p>개봉일 : ${wvo.proddate}</p>
				</c:otherwise>
			</c:choose>
			<p><c:choose><c:when test="${wvo.completiontype==0}">연재중</c:when><c:otherwise>완결</c:otherwise></c:choose></p>
			<a href="${path}/webcontents/episode/regi?cultype=${wvo.cultype}&contnum=${wvo.contnum}" class="btn btn-primary">회차 등록</a>
    </div>
  </div>
  <!-- /.row -->



	<br><br>
  <div class="card h-100">
    <ul class="list-group list-group-flush">
      <li class="list-group-item">
      	<span style="color:blue !important">${wvo.readernum}</span>명이 보는 중 
      	 전체댓글
      </li>
      <li class="list-group-item">공지사항</li>
      <c:if test="${wvo.freenum>0}"><li class="list-group-item">첫편부터 ${wvo.freenum}편 무료</li></c:if>
      <c:if test="${wvo.waiting>0}"><li class="list-group-item">${wvo.waiting}시간마다 무료</li></c:if>
    </ul>
  </div>
	<br><br>

	<!-- 충전 -->
	<div>
		<a href='${pageContext.request.contextPath}/ticket/webtoon?contnum=${wvo.contnum}'>충전</a>
	</div>



	<div style="float:right;">
		<ul style="list-style:none;">
			<li style="display:inline;"><a href="${path}/webcontents/episode/list?cultype=${wvo.cultype}&contnum=${wvo.contnum}&align=asc" style="text-decoration:none; color:black;">첫편부터</a></li>
			|
			<li style="display:inline;"><a href="${path}/webcontents/episode/list?cultype=${wvo.cultype}&contnum=${wvo.contnum}&align=desc" style="text-decoration:none; color:black;">최신편부터</a></li>
		</ul>
	</div>
	<br><br>

  <!-- 회차 목록 -->
  <c:forEach var="ep" items="${epiList}">
  	<div onclick="openEpisode(${wvo.contnum},${ep.epinum},${ep.epnum},${wvo.freenum},${ep.rt},${ep.type});">
	    <div class="card-body">
	      <div class="row">
	        <div class="col-lg-6" style="max-height:200px; overflow:hidden !important">
	            <img class="img-fluid rounded" style="margin-top:-20%;" src="${path}/resources/webcontents/${wvo.cultype}/${ep.thumbnail}">
	        </div>
	        <div class="col-lg-6">
	        	<p class="card-text">
		        	<c:if test="${ep.epnum<=wvo.freenum}">
		        		<div class="freemark">무료</div>
		        	</c:if>
		          <span style="font-size:1.5em">${ep.subtitle}</span>
	          </p>
	          <p>${ep.uploaddate}</p>
	        </div>
	      </div>
	    </div>
	  </div>
	  <hr>
	  
		<div class="modal fade" id="ticketModal" role="dialog" style="margin-top:250px;">
			<div class="modal-dialog">
				<div class="modal-content" style="text-align:center;">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<c:choose>
							<c:when test="${showTicketType!=4}">		
								<h4>이용권 선택</h4>
								<p>사용할 이용권을 선택해 주세요.</p>
								<c:if test="${showTicketType!=1}">
									<hr>
									<div onclick="openEpisode(${wvo.contnum},${ep.epinum},${ep.epnum},${wvo.freenum},${ep.rt},2,1);">
										<p style="color:blue;">대여 (${rental})개</p>
									</div>
								</c:if>
								<c:if test="${showTicketType!=2}">
									<hr>
									<div onclick="openEpisode(${wvo.contnum},${ep.epinum},${ep.epnum},${wvo.freenum},${ep.rt},1,1);">
										<p style="color:blue;">소장 (${own})개</p>
									</div>
								</c:if>
							</c:when>
							<c:when test="${showTicketType==4}">
								<h4>이용권 충전</h4>
								<hr>
								<div onclick="location.href='${path}/ticket/webtoon?contnum=${wvo.contnum}'"><p>충전하러가기</p></div>
							</c:when>
						</c:choose>
						<hr>
						<div data-dismiss="modal"><strong style="margin:0px; color:blue;">취소</strong></div>
					</div>
				</div>
			</div>
		</div>
  </c:forEach>
</div>



<div class="modal fade" id="ownTicketUseModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content ticketuse" style="text-align:center;">
			<div class="modal-body">
				<p>소장이용권 한개를 사용하였습니다.</p>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="rentalTicketUseModal" role="dialog">
	<div class="modal-dialog" style="text-align:center;">
		<div class="modal-content ticketuse">
			<div class="modal-body">
				<p>대여이용권 한개를 사용하였습니다.</p>
			</div>
		</div>
	</div>
</div>

