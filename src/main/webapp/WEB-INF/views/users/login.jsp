<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:200px;   
      width:40%;
    }
</style>


<div class="container" id="container">
  <div class="row">
    <div class="col-lg-8 mb-4">
      <h3>로그인</h3><br>
      <form method="post" action="${pageContext.request.contextPath}/users/login">
        <div class="control-group form-group">
          <div class="controls">
          	<p>
							<label>이메일</label>
							<input class="w3-input" type="text" id="email" name="email" required  autocomplete=off>
           	</p>
					</div>
        </div>
        <div class="control-group form-group">
          <div class="controls">
						<label>비밀번호</label>
						<input class="w3-input" type="password" id="pwd" name="pwd" required>
					</div>
        </div>
				<button type="button" class="btn btn-warning" onclick='location.href="${pageContext.request.contextPath}/users/join"'>회원가입</button>
				<button type="submit" class="btn btn-warning">로그인</button>
				<button type="button" class="btn btn-warning" onclick='location.href="${pageContext.request.contextPath}/users/searchpwd"'>비밀번호 찾기</button>
      </form>
    </div>
  </div>
</div>

