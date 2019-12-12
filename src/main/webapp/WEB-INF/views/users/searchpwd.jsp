<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
			<p>
				<h4>비밀번호 찾기</h4>
			</p>
			</div>
			<p>
				<h8>비밀번호를 찾기 위한 이메일을 입력해주세요.</h8>
			</p>
			<div>
				<p>
					<label>Email</label>
					<input class="w3-input" type="text" id="email" name="email" required>
				</p>
				<p class="w3-center">
					<button type="button" id=findBtn class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-round">확인</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
				</p>
			</div>
		</div>
	</div>
	
	
	
	