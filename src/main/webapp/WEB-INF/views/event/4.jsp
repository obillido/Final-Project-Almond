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
	#title{text-align: center; padding-top: 30px;}
	#hint{text-align: center; padding-top: 30px;}

	
	@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|East+Sea+Dokdo&display=swap');
	.font2{font-family:'Do Hyeon', sans-serif;}
</style>
<script type="text/javascript">	
	function check(){
		if(${empty usernum}){
			alert("로그인 후 이용할 수 있는 서비스입니다.");
		}else if(${already=="true"}){
			alert("이미 참여한 이벤트입니다.");
		}else if(${sysdate>evo.enddate}){
			alert("종료된 이벤트입니다.");
		}else{
			var keyword=$("#keyword").val();
			if(keyword.length<1){
				alert("정답을 입력해주세요.");
			}else{
				$.ajax({
					url:"${pageContext.request.contextPath }/event4/checkAnswer",
					type:"post",
					data:{"keyword":keyword,"eventnum":'${eventnum}'},
					dataType:"xml",
					success:function(data){
						alert($(data).find("msg").text());
						if($(data).find("code").text()=="fail")	alert("오류");
					}
		   	});
			}
		}
	}	
	
</script>
<div class="container">
<div id="wrap">
	<ol class="breadcrumb"style="background-color: white; font-size: 30px;">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath }/"style="color: darkorange;">메인페이지</a>
      </li>
      <li class="breadcrumb-item active">QUIZ</li>
    </ol>

	<div id="e1"class="font2">
		<h1>아몬드가 쏜다!</h1><br>
		<h4>퀴즈 정답을 맞추신 모든 분들에게</h4><br>
		<h2>${evo.price}캐시를 드립니다~!</h2><br>	
		<p>이벤트기간 : ${evo.startdate} ~ ${evo.enddate}<p>
	</div>
	<div id="e2"class="font2">
		<div id="title"class="font2"><p>&nbsp;&nbsp;Q. ${evo.title}</p></div>
		<div id="hint"class="font2">
			<p> ${evo.content}</p>
			<input type="text" id="keyword" style="padding: 20px; width: 60%;"
				placeholder="OOO?"  autocomplete=off><br>
			<button class="font2" style="width: 100%; margin-top:70px; padding: 20px;
				color: white; background-color: #E56E29; font-size: 30px;" onclick="javascript:check();">정답 제출하기</button>
		</div>
	</div>
</div>
</div>