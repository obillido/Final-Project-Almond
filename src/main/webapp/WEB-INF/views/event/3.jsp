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
<style>
	@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|East+Sea+Dokdo&display=swap');
	#font{font-family:'Do Hyeon', sans-serif;}
</style>
 <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <ol class="breadcrumb"style="background-color: white; font-size: 30px;" id="font">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath }/" style="color: darkorange;">메인페이지</a>
      </li>
      <li class="breadcrumb-item active">열람/리뷰이벤트</li>
    </ol>
    <!-- Portfolio Item Row -->
    <div class="row">
      <div class="col-md-7">
        <img style="width: 90%;" class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/달빛조각사.jpg" alt="">
      </div>
      <div class="col-md-5" id="font" style="color: #6c757d;font-size: 20px;">     
        <p>이벤트기간 : 12월 8일(일)~12월15일(월)<br>
			당첨자 발표 및 캐시뽑기권 지급 : 12월 16일(화)<br>
			(개별 안내)<br></p>
        <h3 class="my-3">경품</h3>
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventTK/6.jpg">
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventTK/5.jpg">
      </div>
    </div>
    <!-- Related Projects Row -->
    <h3 class="my-4" id="font">이벤트작품 보러가기</h3>
 		<div class="row">
      		<div class="col-md-3 col-sm-4 mb-4">
	       		<a href="${pageContext.request.contextPath}/webcontents/episode/list?contnum=2">
	         		 <img class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/달빛조각사.jpg" alt="">
	        	</a>
      		</div>  		
      		<div class="col-md-3 col-sm-6 mb-4" id="font" >     
		        <div id="content">
		        	<ul>
		          		<li style="list-style:none; font-size: 1.3em;">
		          		<br>
		          		달빛조각사[독점연재]<br>
		          		<br>
		          		 판타지소설 <br>
		          		<br>
		          		작가 남희성
		          		</li>
		        	</ul>
		        </div>
      		</div>
      		<div class="col-md-6 col-sm-6 mb-4" id="font" style="font-size: 20px;">     
		        <div id="content" >
		        	<form action="${pageContext.request.contextPath}/event3" method="post">
		        	
		        		<input type="hidden" value="${eventnum}" name="eventnum">
		        		<input type="hidden" value="${eventnum2}" name="eventnum2">		        		      		
		        		<c:if test="${userStatus.equals('admin')}">        		
		        			<input type="submit" value="당첨자뽑기">
		        		</c:if> 
		        		<div id="list" style="width:250px;height:200px;float:left; text-align: center;color: darkorange;">
		        			<h3>댓글당첨</h3>
			        		<c:if test="${not empty list}">
						      	 <c:forEach var="vo" items="${list }">
									<p>
										당첨유저 : ${vo.usernum }(닉네임:${vo.nickname})
									</p>
								</c:forEach>
							</c:if>
		        		</div>	
		        		<div id="list2" style="width:250px;height:200px;float:right;text-align: center;color: darkorange;">		        		
		        			<h3>열람당첨</h3>
			        		<c:if test="${not empty list2}">
						      	<c:forEach var="vo1" items="${list2 }">
									<p>
										당첨유저 : ${vo1.usernum }(닉네임:${vo1.nickname})
									</p>
								</c:forEach>
							</c:if>
		        		</div> 	        		
		        	</form>
		        </div>
      		</div>  	
		</div>
  </div>


