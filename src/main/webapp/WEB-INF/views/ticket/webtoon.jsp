<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div class="d1">
	<div class="d2">이용권충전<br>
		<a>내가 가진 캐시 :${vo.cash}</a><br>
		<a>대여권 : </a><br>
		<a>소장권 : </a><br>
	</div>
	
	<div class="d3">
		<form action="${pageContext.request.contextPath }/ticketrent" method="post">
			<input type="radio" name="ticketrent" value="2,${ticket.cnt1},${ticket.rentalprice1}" checked="checked">${ticket.cnt1}개
			<a>${ticket.rentalprice1}캐시</a><br>
			<input type="radio" name="ticketrent" value="2,${ticket.cnt2},${ticket.rentalprice2}" >${ticket.cnt2}개
			<a>${ticket.rentalprice2}캐시</a><br>
			<input type="radio" name="ticketrent" value="2,${ticket.cnt3},${ticket.rentalprice3}" >${ticket.cnt3}개
			<a>${ticket.rentalprice3}캐시</a><br>		
		</form>
	</div>
	<!-- 결제창 modal 영역 -->	
	
	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="payment">결제하기</button>
	
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h4 class="modal-title">결제창</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button> 
	      </div>
	      <div class="modal-body">  	
	      	<div>
		        <p>● 이 작품에서만 사용가능한 이용권입니다.</p>
		        <p>● 보너스 지급 이용권은 구매 취소가 되지 않습니다.</p>
		    </div>
	      </div>
	      <div class="modal-footer">
   			<form action="${pageContext.request.contextPath }/ticket/buy" method="post">
				<input type="hidden" name="usernum" value="${usernum}">
				<input type="hidden" name="contnum" value="${contnum}">
				<input type="hidden" name="type" value="" id="type">
				<input type="hidden" name="cnt" value="" id="cnt">
				<input type="hidden" name="price" value="" id="price">
	       		<button type="submit" class="btn btn-default" data-dismiss="modal">구매하기</button>
			</form>
	      </div>
	    </div>
	  </div>
	</div>
</div>

<script type="text/javascript">
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

