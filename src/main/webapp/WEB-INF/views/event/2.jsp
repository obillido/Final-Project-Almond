<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	window.onload=function(){
		if(${msg!=null}){
			alert("${msg}");
		}
	}
</script>

 <div class="container">
    <h1 class="mt-4 mb-3">이벤트2
      <small>열람이벤트</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Portfolio Item</li>
    </ol>

    <div class="row">

      <div class="col-md-7">
        <img style="width: 90%" class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/세종의 누이.jpg" alt="">
      </div>
	
     <div class="col-md-5">
       <h3 class="my-3">이벤트 내용</h3>
        <p>이벤트 기간 : 12월 1일(일)~12월8일(월)<br>
			참여방법 : 이벤트 기간 동안,<br>
			 작품을 감상해 주시는 분들 중 추첨<br>
			당첨자 발표 : 12월 9(화), 알람 개별고지<br></p>
        <br>
        <h3 class="my-3">경품</h3>   
         <br>        
         <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventTK/CASH.jpg" alt="">  
      	 <form action="${pageContext.request.contextPath}/event2" method="post">
      	 	<input type="hidden" value="${eventnum}" name="eventnum">
      	 	<button type="submit"style="width: 100px;height: 60px;">당첨</button>
      	 </form>
      	 <c:if test="${not empty list}">
      	 <c:forEach var="vo" items="${list }">
			<p>
				당첨유저 : ${vo.usernum }(닉네임:${vo.nickname})
			</p>
		</c:forEach>
		</c:if>
      </div>
     
    </div>

    <h3 class="my-4">이벤트 작품 보러 가기</h3>
    <div class="row">
    
      <div class="col-md-3 col-sm-4 mb-4">
        <a href="#">
        <img class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/세종의 누이.jpg" alt="">        
        </a>
      </div>
      
        <div class="col-md-8 col-sm-4 mb-4">     
          <div id="content">
          	<ul>
          		<li style="list-style:none;">
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
