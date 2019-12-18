<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	
	#e1{width:80%; height:400px; background-color: #E56E29;
		text-align: center;padding-top: 50px; margin: auto;
		color: white;}
	#e2{width:80%; height:400px; background-color:#F5B921;
		padding-top: 30px; margin: auto; margin-top:30px;
		margin-bottom: 20px; }
	#hint{text-align: center; padding-top: 30px;}
</style>
<script type="text/javascript">
	window.onload=function(){
		if(${msg!=null}){
			alert("${msg}");
		}
	}
</script>
<div class="container">
<div id="wrap">
	<h1>QUIZ</h1>
	<ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">알림페이지</a>
      </li>
    </ol>
	<div id="e1">
		<h1>아몬드가 쏜다!</h1><br>
		<h4>퀴즈 정답을 맞추신 모든 분들에게</h4><br>
		<h2>1000캐시를 드립니다~!</h2><br>	
		<p>이벤트기간 : 12월25일<br>
		       캐시유효기간: 지급일로부터 3일</p>
	</div>
	<div id="e2">
		<p>&nbsp;&nbsp;Q. ooo는 불포화지방산이 풍부하고
		 	비타민 E가 풍부하여 피부 미용에도 좋으며
			철분이나 칼슘도 풍부해 건강에 좋다.
		</p>
		<div id="hint">
			<p>(힌트 : 견과류의 일종으로 no.1 미디어 플랫폼 이름과 같다!)<br>
				(정답 글자수 : 3자)</p>
			<form action="${pageContext.request.contextPath}/event4" method="post">
				<input type="text" name="answer" style="padding: 20px; width: 60%;"
					placeholder="ooo?"><br>
				<input type="hidden" value="${eventnum}" name="eventnum">
				<button style="width: 100%; margin-top:80px; padding: 20px;
					color: white; background-color: #E56E29; font-size: 30px;" type="submit">정답 제출하기</button>
			</form>
		</div>
	</div>
</div>
</div>