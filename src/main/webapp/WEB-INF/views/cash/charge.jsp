<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<script type="text/javascript">
   function chk(){
	   var agree=document.getElementById("agree");
	   if(agree.checked==false){
		   alert("이용약관에 동의하여야 캐시 충전이 가능합니다.");
		   return false;
	   }
	   return true;
   }
   $(function () {
	   $('[data-toggle="popover"]').popover()
   })
</script>


<form method="post" action="${path}/cash/charge" onsubmit="return chk()">
   <input type="hidden" name="usernum" value="${usernum }"><br>
		<div class="container">
			<div class="row">
				<div class="col">
					<p><strong>충전단위</strong></p>
					<div class="custom-control custom-radio">
						<input type="radio" name="cashamount" id="cashamount1" class="custom-control-input" value="1000" checked="checked">
						<label class="custom-control-label" for="cashamount1">1,000캐시</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="cashamount" id="cashamount2"  class="custom-control-input" value="5000">
						<label class="custom-control-label" for="cashamount2">5,000캐시</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="cashamount" id="cashamount3"  class="custom-control-input" value="10000">
						<label class="custom-control-label" for="cashamount3">10,000캐시</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="cashamount" id="cashamount4"  class="custom-control-input" value="50000">
						<label class="custom-control-label" for="cashamount4">50,000캐시</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="cashamount" id="cashamount5"  class="custom-control-input" value="100000">
						<label class="custom-control-label" for="cashamount5">100,000캐시</label>
					</div>
					<br><br>
					<p><strong>결제방법</strong></p>
					<div class="custom-control custom-radio">
						<input type="radio" name="paymethod" id="paymethod1" class="custom-control-input" value="신용카드" checked="checked">
						<label class="custom-control-label" for="paymethod1">신용카드</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="paymethod" id="paymethod2" class="custom-control-input" value="무통장입금">
						<label class="custom-control-label" for="paymethod2">무통장입금</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="paymethod" id="paymethod3" class="custom-control-input" value="계좌이체">
						<label class="custom-control-label" for="paymethod3">계좌이체</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="paymethod" id="paymethod4" class="custom-control-input" value="아몬드페이">
						<label class="custom-control-label" for="paymethod4">아몬드페이</label>
					</div>
					<br><br>
					<button type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="이용약관" 
					data-content="1. 충전된 캐시의 유효기간은 충전 후 5년입니다. 
					              2. 광고성 이벤트 등 회사가 무료로 지급한 캐시는 환불되지 않습니다. 
					              3. 자세한 내용은 아몬드페이지 유료서비스 이용약관에서 확인할 수 있습니다.">이용약관 보기</button>
					<br><br>
					<p><strong>이용안내</strong> 및 <strong>결제 진행</strong>에 동의합니다.</p>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" name="agree" id="agree" class="custom-control-input">
						<label class="custom-control-label" for="agree">동의</label>
					</div>
				</div>
			</div>
			<br>
			<input type="submit" value="충전하기" class="btn btn-lg btn-success">
			<br><br><br>
		</div>
</form>
