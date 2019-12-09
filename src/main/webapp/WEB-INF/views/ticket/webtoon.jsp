<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

 
<link href="${pageContext.request.contextPath}/resources/ticket/ticket1.css" rel="stylesheet">

 
<div class="wrap">
	
	<div class="d2">
		<span style="font-family: 돋움체; font-size: 1.6em;">이용권 충전</span>
		<div style="margin: auto; width: 100%;">
			<div class="title">
			 ${title} [연재중]
		 	
				<div class="mycash">
					<span style="color:#aaaaaa; font-weight: bold; font-family:바탕;" >내가 가진 캐시:</span>&nbsp;&nbsp;<span style="color:#787878; font-family: 돋음체; font-weight: bold;">${uc.cash}캐시</span>
				</div>
				<div class="rental">
					<div class="rental_cnt1">
						<span style="font-family:돋움체; color: #5A5AFF; font-weight: bold">대여권 : ${cntRental}개</span>
					</div>
					<div style="float: left; width: 10%; text-align: center; padding-top: 5%; opacity: 0.5; font-size: 1.5em;">
						||
					</div>
					<div class="rental_cnt2">
				        <span style="font-family:돋움체; color:#008C8C; font-weight: bold">소장권 : ${cntOwn}개</span>
				    </div>
				</div>
			</div>
		</div>
			
			
			
		<div class="align_center"><!-- 결제창div -->	
						
			<div class="tab_container">	
		
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1"><span style="font-family: 돋움체; font-size: 18px; font-weight: 600;">대여권 충전</span></li>
				<li class="tab-link" data-tab="tab-2"><span style="font-family: 돋움체; font-size: 18px; font-weight: 600;">소장권 충전</span></li>
			</ul>
		
			<div id="tab-1" class="tab-content current">
			
				<div class="d3">
					<form action="${pageContext.request.contextPath }/ticketrent" method="post">
						<div class="form1">
							<div style="float:left; padding-top: 10px; width: 300px;">
								<input type="radio" name="ticketrent" value="2,${ticket.cnt1},${ticket.rentalprice1}" checked="checked">${ticket.cnt1}개 
							</div>
							<div style="float: right; border: 1px solid;">
								${ticket.rentalprice1}캐시<br>
							</div>
						</div>
						<div class="form2">
							<div style="padding-top: 10px; width: 300px;">
								<input type="radio" name="ticketrent" value="2,${ticket.cnt2},${ticket.rentalprice2}" >${ticket.cnt2}개 <span style="color:red; font-weight: bold">(9개 + 1개 보너스)</span>
								<a>${ticket.rentalprice2}캐시</a><br>
							</div>
						</div>
						<div class="form3">
							<div style="padding-top: 10px; width: 300px;">
								<input type="radio" name="ticketrent" value="2,${ticket.cnt3},${ticket.rentalprice3}" >${ticket.cnt3}개 <span style="color:red; font-weight: bold">(17개 + 3개 보너스)</span>
								<a>${ticket.rentalprice3}캐시</a><br>
							</div>
						</div>
					</form>
					
					<div class="caution">
						- 대여 가능 기간 : 이용권 사용 후 3일<br>
						- 이용권 충전시간이 아닌 <span style="color:black">사용시점부터 3일 동안</span> 볼 수 있습니다.<br>
						- 패키지 상품은 보너스 지급분을 제외한 유로 이용권만 취소가능합니다.<br>
					</div>
	
					<!-- 결제창 modal 영역 -->	
					
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="payment"><span style="color:black; font-weight: bold;">충전하기</span></button>
					
					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					      	<h4 class="modal-title">${title }</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button> 
					      </div>
					      <div class="modal-body">  	
					      	<div>
					      		<div class="btn_tickybuy"> 
					      			[결제창]
					      		</div>
					      		<div class="btn_tickeybuy1">
							        ● 이 작품에서만 사용가능한 이용권입니다.<br>
							        ● 보너스 지급 이용권은 구매 취소가 되지 않습니다.
						        </div>
						    </div>
					      </div>
					      
					      <div class="modal-footer">
				   			<form action="${pageContext.request.contextPath}/ticket/buy" method="post">
								<input type="hidden" name="usernum" value="${usernum}">
								<input type="hidden" name="contnum" value="${contnum}">
								<input type="hidden" name="tknum" value="${ticket.tknum}">
								<input type="hidden" name="type" value="" id="type">
								<input type="hidden" name="cnt" value="" id="cnt">
								<input type="hidden" name="price" value="" id="price">
					       		<button type="submit" class="btn btn-default">구매하기</button>
							</form>
					      </div>
					    </div>
					  </div>
					</div>
		
		
				</div>
			</div>
		
				<div id="tab-2" class="tab-content">
					 Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>
			</div><!-- container -->
		</div>
			
		<div class="foot_caution">
			<span>※이용권 안내</span><br>
			- 해당 콘텐츠는 청약철회가 불가능한 상품이므로 이미 결제된 상품에 대해서는 청약철회가 불가합니다.<br>
			- 홈페이지 사정에 따라 업데이트가 지연될 수 있습니다.<br>
			- 발행자의 의사에 따라 판매 가격이 변경될 수 있으며, 콘텐츠의 가격 변경을 이유로 한 구매 취소는 불가합니다.
		</div>
			
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		});
	});
	$(function(){
		$("#payment").click(function(){
			var tk=$("input[name='ticketrent']:checked").val();
			var tksplit=tk.split(',');
			$("#type").val(tksplit[0]);
			$("#cnt").val(tksplit[1]);
			$("#price").val(tksplit[2]);
		});	
	});

</script>
