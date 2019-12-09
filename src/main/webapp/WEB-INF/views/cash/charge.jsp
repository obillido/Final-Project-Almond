<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style type="text/css">
    #agreement{color:gray;font-size:0.8em;border:1px solid black;padding:5px;}    
</style>


<form method="post" action="${path}/cash/charge">
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
						<label class="custom-control-label" for="paymethod4">"아몬드페이"</label>
					</div>
					<br><br>
					<p><strong>아래 이용안내 및 결제 진행에 동의합니다.</strong></p>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" name="agree" id="agree" class="custom-control-input">
						<label class="custom-control-label" for="agree">동의</label>
					</div>
					<br>
					<div id="agreement">
                       <p>1. 충전된 캐시의 유효기간은 충전 후 5년입니다.</p>
                       <p>2. 사용되지 않은 캐시에 대해서는 7일 이내 청약철회가 가능합니다.</p>
                       <p>3. 미사용된 이용권에 대해서는 환불이 가능하며, 환불 시 환불수수료(10% 또는 1,000원 중 큰 금액)를 제외한 나머지 금액이 환불됩니다.</p>
                       <p>4. 광고성 이벤트 등 회사가 무료로 지급한 캐시는 환불되지 않습니다.</p>
                       <p>5. 자세한 내용은 아몬드페이지 유료서비스 이용약관에서 확인할 수 있습니다.</p>
                    </div>
				</div>
			</div>
			<br>
			<input type="submit" value="충전하기" class="btn btn-sm btn-success">
			<br><br><br>
		</div>
</form>

