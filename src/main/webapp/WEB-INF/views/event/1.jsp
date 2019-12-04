<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">이벤트1
      <small>캐시이벤트</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Portfolio Item</li>
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">
      <div class="col-md-8">
        <img style="width: 90%;" class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/이벤트표지.jpg" alt="">
      </div>
      <div class="col-md-4">     
        <h3 class="my-3">이벤트 상세내용</h3>
        <br>
        <p>아몬드가 쏩니다~!<br>
        	이벤트 작품 한편만 봐도 캐시가 팡팡!</p>
        <ul>
          <li>하루 1편만 봐도,<br>
          	매일 3만명에게 최대 1000캐시 뽑기권 선물!<br></li>
   			<br>
          <li>하루 30편 보면,<br>
          	모두에게 최대 3000캐시 뽑기권 선물!<br></li>
     		 <br>
          <li>하루 50편만 봐도,<br>
          	모두에게 최대 5000캐시 뽑기권 선물!<br></li>
       		 <br>
          <li>매일 1명에게 에어팟 선물!<br>
          	(12월 31일 개별 고지)<br></li>
          	<br>
        </ul>
      </div>
    </div>
    <!-- /.row -->
    <h3 class="my-4">경품</h3>
    <div class="row">
      <div class="col-md-3 col-sm-6 mb-4">          
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventTK/4.jpg" alt="">
      </div>
      <div class="col-md-3 col-sm-6 mb-4">  
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventTK/3.jpg" alt="">
      </div>
      <div class="col-md-3 col-sm-6 mb-4">      
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventTK/2.jpg" alt="">
      </div>
      <div class="col-md-3 col-sm-6 mb-4">
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/eventGIFT/3.jpg" alt="">
      </div>
    </div>   
    <!-- Related Projects Row -->
    <h3 class="my-4">이벤트 작품</h3>
    <div class="row">
      <div class="col-md-3 col-sm-6 mb-4">
        <a href="#">
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/갓오브블랙필드.jpg" alt="">
        </a>
      </div>
      <div class="col-md-3 col-sm-6 mb-4">
        <a href="#">
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/아도니스.jpg" alt="">
        </a>
      </div>
      <div class="col-md-3 col-sm-6 mb-4">
        <a href="#">
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/무당기협.jpg" alt="">
        </a>
      </div>
      <div class="col-md-3 col-sm-6 mb-4">
        <a href="#">
          <img class="img-fluid" src="${pageContext.request.contextPath }/resources/BOOK/닥터 최태수.jpg" alt="">
        </a>
      </div>
      
      
    </div>
    <!-- /.row -->
    <div id="info" style="color: gray;">
		<h3>알려드려요!</h3>
		- 이벤트 기간: 12/23(월)~12/30(월),7일간<br>
		<br>
		- 이벤트 작품은 기간 내 변경되거나 추가될 수 있습니다.<br>
		<br>
		- 기간 내 이벤트 작품을 하루 1편이상 보면 매일 추첨해 다음날 푸시메시지로 최대 1천캐시 뽑기권을 지급합니다.<br>
		(매일 중복 당첨 가능)<br>
		<br>
		- 기간 내 이벤트 작품을 하루 30편 이상 보면 다음날 푸시메시지로 최대 3천캐시 뽑기권을 전원 지급합니다.<br>
		(기간 내 1회 지급)<br>
		<br>
		- 기간 내 이벤트 작품을 하루 50편 이상 보면 다음날 푸시메시지로 최대 5천캐시 뽑기권을 전원 지급합니다.<br>
		(기간 내 1회 지급)<br>
		<br>
		- 3천 캐시, 5천 캐시 뽑기권은 하루에 중복 지급되지 않으며 이벤트 참여 당일, 최종열람 회차 기준으로 뽑기권 한 종류만 지급됩니다.<br>
		(예 : 50편 이상 열람 시 최대 5천 캐시 뽑기권만 지급)<br>
		<br>
		- 기간 내 이벤트 작품을 하루 50편 이상 보면 추첨을 통해 매일 1명에게 애플 AirPods Pro를 1개 드리며 <br>
		  12/31 알람으로 개별 고지 됩니다.(중복당첨 불가, 총6명)<br>
		<br>
		- 5만원 이상 경품의 제세공과금은 본인 부담입니다.<br>
		<br>
		- 본 이벤트는 당사 사정에 따라 사전예고 없이 변경되거나 취소될 수 있습니다.<br>
	</div>
  </div>



