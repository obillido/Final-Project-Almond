<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#joinuser").click(function() {
			location.href="${pageContext.request.contextPath }/join";	
		});
		$("#searchpwd").click(function() {
			location.href="${pageContext.request.contextPath }/searchpwd";	
		});
	});
</script>
<div class="container">
  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href='${pageContext.request.contextPath}/'>Home</a>
    </li>
    <li class="breadcrumb-item active">Login</li>
  </ol>
  <div class="row">
    <div class="col-lg-8 mb-4">
      <h3>로그인</h3><br>
      <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="control-group form-group">
          <div class="controls">
          	<p>
					<label>이메일</label>
					<input class="w3-input" type="text" id="email" name="email" required>
            </p>
            <div class="check_font" id="email_check">
	</div>
	</div>
          </div>
        <div class="control-group form-group">
          <div class="controls">
					<label>비밀번호</label>
					<input class="w3-input" type="password" id="pwd" name="pwd" required>
		</div>
        </div>
          <div id="success"></div>
		  <input type="submit" class="btn btn-default btn-login-submit" id="joinuser" value="회원가입">
          <button type="submit" class="btn btn-primary" id="sendMessageButton">로그인</button>
		<button type="submit" class="btn btn-primary" id="searchpwd">비밀번호 찾기</button>
      </form>
    </div>
  </div>
</div>

