<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	window.onload=function(){
		event2(0);
	}
		
	function event2(status){
		$.ajax({
			url:"${pageContext.request.contextPath}/event2/list",
			dataType:"xml",
			type:"post",
			data:{"eventnum":${eventnum},"status":status},
			success:function(data){
				if($(data).find("code").text()!='fail'){
					$("#winnerList p").remove();
					if($(data).find("msg").text().length>0)	alert($(data).find("msg").text());
					$(data).find("user").each(function(){
						var comm="<p>당첨유저 : "+$(this).find("usernum").text()+"(닉네임 : "+$(this).find("nickname").text()+")</p>";
						$("#winnerList").append(comm);
					});
				}else{
					alert("실패");
				}
			}
		});
	}
	
</script>

 <div class="container">
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath }/">Home</a>
      </li>
      <li class="breadcrumb-item active">열람이벤트</li>
    </ol>

    <div class="row">

      <div class="col-md-7">
        <img style="width: 90%" class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/세종의 누이.jpg" alt="">
      </div>
	
     <div class="col-md-5" style="color: #6c757d;">
       <h3 class="my-3">이벤트 내용</h3>
        <p>이벤트 기간 : 12월 1일(일)~12월8일(월)<br>
						참여방법 : 이벤트 기간 동안,<br>
						 작품을 감상해 주시는 분들 중 추첨<br>
						당첨자 발표 : 12월 9(화), 알람 개별고지<br></p>
        <br>
        <h3 class="my-3">경품</h3>           
         <img class="img-fluid" style="margin-left: -15px;" src="${pageContext.request.contextPath }/resources/eventTK/CASH.jpg">  
      	 <br>
      	 <c:if test="${userStatus.equals('admin')}">
      	 		<button type="button" style="width: 100px;height: 60px;" onclick="javascript:event2(1)">당첨</button>
      	 </c:if>
      	 <br>
      	 <div id="winnerList"></div>
      </div>
     
    </div>

    <h3 class="my-4">이벤트 작품 보러 가기</h3>
    <div class="row">
    
      <div class="col-md-3 col-sm-4 mb-4">
        <a href="${pageContext.request.contextPath }/webcontents/episode/list?contnum=14">
        <img class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/세종의 누이.jpg" alt="">        
        </a>
      </div>
      
        <div class="col-md-8 col-sm-4 mb-4">     
          <div id="content">
          	<ul>
          		<li style="list-style:none; font-size: 1.3em;">
          		<br>
          		세종의 누이[독점연재]<br>
          		<br>
          		몇명이 보는지 / 로맨스소설 / 지미신 <br>
          		<br>
          		업데이트날짜
          		</li>
          	</ul>
          </div>
      </div>
    </div>
  </div>
