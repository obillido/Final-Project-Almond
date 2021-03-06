<%@page import="project.app.almond.vo.EpisodeReadingVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


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
		width:32%; margin-left:10px;
	}
	.episode .type{
		width:16%; height:100%;
		display:inline-block;
		text-align:center;
	}
	
	.lastread{
		padding-top:13px;
		margin-bottom:20px;
		width:100%; height:90px;
		border:1px solid orange;
		background-color:orange;
		color:black;
		font-size:1.3em;
	}
	
	.charge{
		width:100%; height:100px;
		border:1px solid black;
		text-align:center;
		margin-bottom:20px;
		padding-top:15px;
	}
	.charge-text{
		display:inline-block;
		width:32%; height:100%;
	}
	.charge-text strong{font-size:1.5em;}
	.charge-text span{font-soze:1.2em; color:grey;}
	
	.info-ul li{height:60px; padding-top:15px;}
	.pro-progress{display:inline-block;}
	.progress-box{
		padding:0px !important; margin:0px !important;
		display:inline-block;
		width:200px; height:30px;
		text-align:right;
		float:right;
	}
	.progress{
		position:absolute; 
		background-color:red;
		height:30px;
		max-width:200px !important;
		width:${(1-remainingWaitingTime/(wvo.waiting*60))*200}px;
	}
	.progress-text{
		position:relative;
		color:white;
		text-align:center;
		width:100%; height:100%;
		margin-top:2px;
	}
	
</style>



<script type="text/javascript">
	window.onload=function(){
		//if('${not empty msg}') alert('${msg}');
		$("#charge").on('click',function(){
			if(${empty usernum}){
				alert("로그인 후 이용 가능한 서비스입니다.");
			}else{
				var webtype; 
				if(${cultype==1}) webtype="webtoon";
				else if(${cultype==2}) webtype="novel";
				else if(${cultype==3}) webtype="drama";
				else if(${cultype==4}) webtype="";
				else if(${cultype==5}) webtype="movie";
				location.href="${pageContext.request.contextPath}/ticket/"+webtype+"?contnum=${wvo.contnum}";
			}
		});
	}

	function openEpisode(epinum,epnum,freenum,rt,type,status,me){
		if(${empty userStatus}){
			if(epnum<=freenum){
				post_to_url(["epinum","type"],[epinum,5]);
			}else if(${remainingWaitingTime<=0}){
				post_to_url(["epinum","type"],[epinum,6]);
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
			}else if(type==1 || ((type==2 || type==6) && rt<=4320 && rt>=0)){ //이전에 티켓을 사용한 경우
				post_to_url(["epinum","type"],[epinum,(type+2)]);
			}else{
				if(${empty usernum}){
					alert("로그인 후 이용가능한 서비스입니다.");
				}else{
					$("#ticketModal"+epinum).modal();
				}
			}
		}else{
			post_to_url(["epinum","type"],[epinum,1]);
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
	function lastread(epinum){
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
      <h2>${wvo.title}
      <small class="text-muted">
      <c:choose><c:when test="${wvo.completiontype==0}">
      <span class="badge badge-pill badge-warning" style="font-size:0.7em">연재중</span></c:when>
      <c:otherwise><span class="badge badge-pill badge-warning" style="font-size:0.7em">완결</span></c:otherwise>
      </c:choose>
      </small>
      </h2>
      <br><br>
			<c:choose>
				<c:when test="${wvo.cultype==1||wvo.cultype==2}">
					<p><strong>글</strong> &nbsp  ${wvo.writer}</p>
					<c:if test="${wvo.cultype==1 }"><p><strong>그림</strong>  &nbsp ${wvo.illustrator}</p></c:if>
					<p><strong>발행자</strong> &nbsp  ${wvo.publisher}</p>
					<p><strong>작품설명</strong> &nbsp  ${wvo.outline}</p>
					<c:choose>
					<c:when test="${wvo.agegrade==0}">
					<p><strong>연령정보</strong> &nbsp  전체이용가</p></c:when>
					<c:otherwise><p><strong>연령정보</strong> &nbsp  ${wvo.agegrade}세 이상 이용가</p></c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<p><strong>감독</strong> &nbsp  ${wvo.director}</p>
					<p><strong>출연</strong> &nbsp  ${wvo.actor}</p>
					<p><strong>시간</strong> &nbsp  ${wvo.runtime}분</p>
					<p><strong>개봉일</strong> &nbsp  ${wvo.proddate}</p>
					<p><strong>작품설명</strong> &nbsp  ${wvo.outline}</p>
					<c:choose>
						<c:when test="${wvo.agegrade==0}">
						<p><strong>연령정보</strong> &nbsp  전체이용가</p></c:when>
						<c:otherwise><p><strong>연령정보</strong> &nbsp  ${wvo.agegrade}세 이상 이용가</p></c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<c:if test="${not empty userStatus}">
				<a href="${path}/webcontents/episode/insert?contnum=${wvo.contnum}" class="btn btn-outline-dark">회차 등록</a>
			</c:if>
    </div>
  </div>
  <!-- /.row -->

	<br><br>
  <div class="card h-100">
		<ul class="list-group list-group-flush info-ul">
			<li class="list-group-item">
				<fmt:formatNumber var="readernum" value="${wvo.readernum}" pattern="0"/>
      	<span style="color:blue !important">${readernum}</span>명이 보는 중 
     	</li>
     	<li class="list-group-item">
    	  <a href="${path }/notice/list?contnum=${wvo.contnum}">공지사항</a>
   		</li>
      <c:if test="${wvo.freenum>0}"><li class="list-group-item">첫편부터 ${wvo.freenum}편 무료</li></c:if>
      <c:if test="${wvo.waiting>0}">
	      <li class="list-group-item">
	      	<div class="pro-progress">
	      	<c:choose>
	      		<c:when test="${wvo.waiting/24>=1}">
	      			<fmt:formatNumber var="waitingDay" value="${wvo.waiting/24}" pattern="0"/>
	      			${waitingDay}일마다 무료
	      		</c:when>
	      		<c:otherwise>${wvo.waiting}시간마다 무료</c:otherwise>
	      	</c:choose>
	      	</div>
	      	<div class="w3-grey progress-box">
					  <div class="progress" <c:if test="${remainingWaitingTime<=0}">style="width:100%;"</c:if>></div>
					  <div class="progress-text">
							<fmt:formatNumber var="rest" value="${remainingWaitingTime}" pattern="0"/>
							<fmt:formatNumber var="day" value="${rest/60/24-(rest/60/24)%1}" pattern="0"/>
							<fmt:formatNumber var="hour" value="${rest/60-(rest/60)%1-day*24}" pattern="0"/>
							<c:if test="${day>=1}">${day}일</c:if>
							<c:if test="${hour>=1}">${hour}시간</c:if>
							<c:choose>
								<c:when test="${empty usernum}">로그인 후 이용 가능</c:when>
								<c:when test="${remainingWaitingTime>=1}">${rest-(rest)%1-hour*60-day*60*24}분 남음</c:when>
								<c:when test="${remainingWaitingTime<=0}">무료 열람 가능</c:when>
								<c:otherwise>1분 미만 남음</c:otherwise>
							</c:choose>
					</div>
	      </li>
      </c:if>
    </ul>
  </div>
	<br>



	<!-- 충전 -->
	<div class="charge">
		<div class="charge-text">
			<strong>${totalEpiCnt}</strong>
			<br>
			<span>전체</span>
		</div>
		<div class="charge-text">
			<strong>${userEpiCnt}</strong>
			<br>
			<span>내 열람</span>
		</div>
		<div class="charge-text" id="charge">
			<strong>${ticketCnt}</strong>
			<span style="color:black;">충전</span>
			<br>
			<span>보유 이용권</span>
		</div>
	</div>



	<!-- 이어보기 -->
	<div style="width:100%; text-align:center;" 
			id="lastread" onclick="javascript:lastread(${epiLastRead.epinum})">
		<a href="javascript:openEpisode(${epiLastRead.epinum},${epiLastRead.epnum},${wvo.freenum});" class="btn btn-primary lastread">
			<c:choose>
				<c:when test="${not empty usernum && not empty epiLastRead}">
					<strong>이어보기</strong>
				</c:when>
				<c:otherwise>
					<strong>첫편보기</strong>
				</c:otherwise>
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
	        	<c:choose>
	        		<c:when test="${empty ep.thumbnail}">
	        			<img class="img" src="${path}/resources/webcontents/${wvo.cultype}/${wvo.img}">
	        		</c:when>
	        		<c:otherwise>
	           	 <img class="img" src="${path}/resources/webcontents/${wvo.cultype}/${ep.thumbnail}">
	        		</c:otherwise>
	        	</c:choose>
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
	        			<c:when test="${(ep.type==2||ep.type==6) && ep.rt<=4320}"> <!-- 대여는 3일동안만 볼 수 있음 -->
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

