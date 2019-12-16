<%@page import="project.app.almond.vo.EpisodeReadingVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	.episode{
		height:250px;
	}
	.episode .img{
		margin:-10% -10%;
		overflow:hidden;
	}
	.episode .text{
		width:35%; margin-left:10px;
	}
	.episode .type{
		width:12%; height:100%;
		display:inline-block;
		text-align:center;
	}
</style>




<script type="text/javascript">
	window.onload=function(){
		if(${msg!=null}){
			alert(${msg});
		}
		
	}

	function openEpisode(epinum,epnum,freenum,rt,type,status,me){
	
		if(epnum<=freenum || ${wvo.waiting==0}){
			post_to_url(["epinum","type"],[epinum,5]);
		}else if(status==1){ //티켓 사용해서 보기
			$("#ticketModal"+epinum).modal("hide");
			if(type==2){
				setTimeout('$("#rentalTicketUseModal").modal()',200);
				setTimeout('$("#rentalTicketUseModal").modal("hide");',900);
			}
			else{
				setTimeout('$("#ownTicketUseModal").modal()',200);
				setTimeout('$("#ownTicketUseModal").modal("hide");',900);
			}
			setTimeout('post_to_url(["epinum","type"],['+epinum+','+type+'])',1000);
		}else if(type==1 || (type==2 && rt<=4320 && rt>=0)){ //이전에 티켓을 사용한 경우
			post_to_url(["epinum","type"],[epinum,(type+2)]);
		}else{
			if(${usernum==null}){
				alter("로그인이 필요한 서비스입니다.");
			}else{
				$("#ticketModal"+epinum).modal();
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
	function aaa(epinum){
		$("#episode"+epinum).trigger('click');
	}
</script>



<!-- Page Content -->
<div class="container" style="margin-top:100px;">

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
			<a href="${path}/webcontents/episode/insert?contnum=${wvo.contnum}" class="btn btn-primary">회차 등록</a>
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



	<!-- 이어보기 -->
	<div style="width:100%; text-align:center;" id="aaa" onclick="javascript:aaa(${epiLastRead.epinum})">
		<a href="javascript:openEpisode(${epiLastRead.epinum},${epiLastRead.epnum},${wvo.freenum});" class="btn btn-primary">
			<c:choose>
				<c:when test="${not empty usernum && not empty epiLastRead}"><span>이어보기</span></c:when>
				<c:otherwise><span>첫편보기</span></c:otherwise>
			</c:choose>
			<br>
			<c:choose>
				<c:when test="${empty epiLastRead.subtitle}"><span>${wvo.title} ${epiLastRead.epnum}화</span></c:when>
				<c:otherwise><span>${epiLastRead.epnum}화 ${epiLastRead.subtitle}</span></c:otherwise>
			</c:choose>
		</a>
	</div>



	<div style="float:right;">
		<ul style="list-style:none;">
			<li style="display:inline;"><a href="${path}/webcontents/episode/list?contnum=${wvo.contnum}&align=asc" style="text-decoration:none; color:black;">첫편부터</a></li>
			|
			<li style="display:inline;"><a href="${path}/webcontents/episode/list?contnum=${wvo.contnum}&align=desc" style="text-decoration:none; color:black;">최신편부터</a></li>
		</ul>
	</div>
	<br><br>

  <!-- 회차 목록 -->
  <c:forEach var="ep" items="${epiList}">
 		<div onclick="openEpisode(${ep.epinum},${ep.epnum},${wvo.freenum},${ep.rt},${ep.type});" 
 				id="episode${ep.epinum}"
 				<c:if test="${not empty ep.readingdate}">style="background-color:#F2F2F2;"</c:if>	class="episode">
	    <div class="card-body">
	      <div class="row">
	        <div class="col-lg-6" style="max-height:210px; overflow:hidden !important">
	            <img class="img" src="${path}/resources/webcontents/${wvo.cultype}/${ep.thumbnail}">
	        </div>
	        <div class="text">
	        	<p class="card-text">
		        	<c:if test="${ep.epnum<=wvo.freenum}">
		        		<div class="freemark">무료</div>
		        	</c:if>
		        	<span style="font-size:1.5em">
		        	<c:choose>
		        		<c:when test="${empty ep.subtitle}">${wvo.title} ${ep.epnum}화</c:when>
		        		<c:otherwise>${ep.subtitle}</c:otherwise>
		        	</c:choose>
		          </span>
	          </p>
	          <p>${ep.uploaddate}</p>
	        </div>
	        <div class="type">
	        	<c:if test="${not empty usernum}">
	        		<c:choose>
	        			<c:when test="${ep.type==1}">
	        			<br><p>소장</p><br>
	        			</c:when>
	        			<c:when test="${ep.type==2 && ep.rt<=4320}"> <!-- 대여는 3일동안만 볼 수 있음 -->
	        				<p>대여</p>
	        				<p>
				        		<fmt:formatNumber var="rest" value="${4320-ep.rt}" pattern="0"/>
				        	 	<fmt:formatNumber var="day" value="${rest/60/24-(rest/60/24)%1}" pattern="0"/>
			       				<fmt:formatNumber var="hour" value="${rest/60-(rest/60)%1-day*24}" pattern="0"/>
	        					<c:if test="${day>=1}">${day}일</c:if>
	        					<c:if test="${hour>=1}">${hour}시간</c:if>
	        					<c:if test="${ep.rt>=1}">${rest-(rest)%1-hour*60-day*60*24}분</c:if>
	        				</p>
									<p>남음</p>
	        			</c:when>
	        			<c:when test="${ep.type==2 && ep.rt>4320}">
	        				<br><p>대여기간만료</p><br>
	        			</c:when>
	        		</c:choose>
	        	</c:if>
	        </div>
	      </div>
	    </div>
	  </div>
	  <hr style="margin:0px; border-top: 1px solid lightgrey;">
	  
		<div class="modal fade" id="ticketModal${ep.epinum}" role="dialog" style="margin-top:250px;">
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
									<div onclick="openEpisode(${ep.epinum},${ep.epnum},${wvo.freenum},${ep.rt},2,1,this);">
										<p style="color:blue;">대여 (${rental})개</p>
									</div>
								</c:if>
								<c:if test="${showTicketType!=2}">
									<hr>
									<div onclick="openEpisode(${ep.epinum},${ep.epnum},${wvo.freenum},${ep.rt},1,1,this);">
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

