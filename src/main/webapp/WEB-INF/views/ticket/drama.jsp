<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<link href="${pageContext.request.contextPath}/resources/ticket/ticket1.css" rel="stylesheet">

 
<div class="wrap">
	
	<div class="d2">
		<span style="font-family: 돋움체; font-size: 1.6em; font-weight: bolder;">이용권 충전</span>
		<div style="margin: auto; width: 100%;">
			<div class="title">
			 ${wvo.title} 
			 <c:if test="${wvo.completiontype==0}">[방영중]</c:if>
			 <c:if test="${wvo.completiontype==1}">[방송종료]</c:if>
		 	
				<div class="mycash">
					<span style="color:#aaaaaa; font-weight: bold; font-family:바탕;" >내가 가진 캐시:</span>&nbsp;&nbsp;<span style="color:#787878; font-family: 돋음체; font-weight: bold;">${uc.cash}캐시</span>
				</div>
				<div class="rental">
					<div class="rental_cnt3">
				        <span style="font-family:돋움체; color: #5A5AFF; font-size: x-large; font-weight: bold">대여권 : ${cntRental}개</span>
				    </div>
				</div>
			</div>
		</div>
			
			
			
		<div class="align_center"><!-- 결제창div -->	
						
			<div class="tab_container">	
		
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1" id="tab_3"><span id="rent_charge" style="font-family: 돋움체; font-size: 18px; font-weight: 600;">대여권 충전</span></li>
			</ul>
		
			<div id="tab-1" class="tab-content current">		
				<div class="d3">
					<form method="post">
						<div class="form1">
							<div style="float:left; padding-top: 15px; width: 150px;">
								<input type="radio" name="ticketrent" value="2,${ticket.cnt1},${ticket.rentalprice1}" checked="checked">${ticket.cnt1}개 
							</div>
							<div class="tickt_cash1">
								${ticket.rentalprice1}캐시<br>
							</div>
						</div>
						<div class="form2">
							<div style="float:left; padding-top: 15px; width: 300px;">
								<input type="radio" name="ticketrent" value="2,${ticket.cnt2},${ticket.rentalprice2}" >
								<c:set var="cnt" value="${ticket.rentalprice2/ticket.rentalprice1}"/>
								<fmt:formatNumber var="cnt" value="${cnt}" pattern="0"/>
								${ticket.cnt2}개 <span style="color:red; font-weight: bold">(${cnt}개 + ${ticket.cnt2-cnt}개 보너스)</span>
							</div>
							<div class="tickt_cash2">	
								${ticket.rentalprice2}캐시<br>
							</div>
						</div>
						<div class="form3">
							<div style="float:left; padding-top: 15px; width: 350px;">
								<input type="radio" name="ticketrent" value="2,${ticket.cnt3},${ticket.rentalprice3}" >
								<c:set var="cnt" value="${ticket.rentalprice3/ticket.rentalprice1}"/>
								<fmt:formatNumber var="cnt" value="${cnt}" pattern="0"/>
								${ticket.cnt3}개 <span style="color:red; font-weight: bold">(${cnt}개 + ${ticket.cnt3-cnt}개 보너스)</span>
							</div>
							<div class="tickt_cash3">	
								<a>${ticket.rentalprice3}캐시</a><br>
							</div>
						</div>
					</form>
					
					<div class="caution">
						- <span style="color:black">부가가치세(VAT) 5%가 포함되어 있는 가격입니다.</span><br>
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
					      	<h4 class="modal-title"><${wvo.title }></h4>
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
								<input type="hidden" name="contnum" value="${wvo.contnum}">
								<input type="hidden" name="type" value="" id="type">
								<input type="hidden" name="cnt" value="" id="cnt">
								<input type="hidden" name="price" value="" id="price">
					       		<button type="submit" class="btn btn-primary">구매하기</button>
							</form>
					      </div>
					    </div>
					  </div>
					</div>	
				</div>
			</div>		
				
			</div><!-- container -->
		</div>
		
		
		<!-- 
		<div class="modal" id="cashModal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">
						<p>One fine body&hellip;</p>
						<h1>${title}</h1>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		-->
		
		<div class="modal" id="cashModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-body">
		        <span style="font-weight: bold; color: #0d3967;">현재 잔액이 [${uc.cash }]원 입니다. 충전 하시겠습니까?</span>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="btn-purchase">충전하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		
		<div class="foot_caution2">
			<span>※이용권 안내</span><br>
			- 해당 콘텐츠는 청약철회가 불가능한 상품이므로 이미 결제된 상품에 대해서는 청약철회가 불가합니다.<br>
			- 홈페이지 사정에 따라 업데이트가 지연될 수 있습니다.<br>
			- 발행자의 의사에 따라 판매 가격이 변경될 수 있으며, 콘텐츠의 가격 변경을 이유로 한 구매 취소는 불가합니다.
		</div>
		
		<div class="foot_caution1">
			<span>※규정 안내</span><br>
			- 무료로 지급되는 포인트에 대해서는 환불조치가 불가합니다.<br>
			- 이용권을 충전하여 스트리밍을 이용 시작후에는 해당 콘텐츠에 대해서 청약철회가 불가하므로 신중히 고민하세요.<br>
			- 실제 상영/방영된 영상의 러닝타임과 서비스에서 제공되는 영상의 러닝타임이 다를 수 있으므로, 이를 이유로 하는 어떠한 사항에 대해서는
			    강력한 조치를 취할 것입니다. 조심하세요.<br>
			- 구매한 각 콘텐츠 별로 지정된 기간 동안에만 이용이 가능합니다.  
		</div>
			
	</div>
</div>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">


	$(function(){
		$("#payment").click(function(){
			var tk=$("input[name='ticketrent']:checked").val();
			var tksplit=tk.split(',');
			$("#type").val(tksplit[0]);
			$("#cnt").val(tksplit[1]);
			$("#price").val(tksplit[2]);
			var price=$("#price").val();
			if(${uc.cash}<price){
				$("#cashModal").modal();
				return false;
			}	
		});	
	});
	
	$(function(){
		$("#btn-purchase").click(function(){
			location.href= "${pageContext.request.contextPath}/cash/charge";
		});
	});
	
	

</script>