<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	function pwdCheck(){
		var pwd=document.check1.pwd;
		var email=document.check1.email;
		if(pwd.value.length>15 || pwd.value.length<8) {
			alert("비밀번호는 8~15자 사이로 입력하세요.");
			pwd.focus();
			return false;
		}else if((email.value.indexOf("@")==-1) || (email.value.indexOf(".")==-1)) {
			alert("이메일이 올바른 형태가 아닙니다 @과 .을 포함시켜주세요.");
			email.focus();
			return false;
		}
		var eng=false; // 영문이 입력되지 않았을때 false, 입력되면 true로 바뀜
		var num=false; // 숫자가 입력되지 않았을때 false, 입력되면 true로 바뀜
		var spe=false; // 특수문자가 입력되지 않았을때 false, 입력되면 true로 바뀜
		for(i=0; i<pwd.value.length; i++) {
			var ch=pwd.value.charAt(i);	 
		    if(((ch >= "A") && (ch <= "Z")) || ((ch >= "a") && (ch <= "z"))){
		    	// A랑 Z랑 묶고 , a랑 z랑 묶고 
		    	eng=true;
		    	//A~Z 또는 a~z가 입력되었을때 eng이 true로 바뀜
		    }else if(ch>='0' && ch<='9'){ 
		    	num=true;
		    	// 0~9가 입력되었을때 num이 true로 바뀜
		    }else if(ch=="!" || ch=="@" || ch=="#" || ch=="$" || ch=="%"){
		    	spe=true;
		    	// !,@,#,$,%중 하나 이상이 입력되었을때 spe가 true로 바뀜
		    }
		}
		 	if(eng==false || num==false || spe==false){
		 	//eng가 입력이 안되었을때 또는 num이 입력이 안되었을때 또는 spe가 입력이 안되었을때
		 		alert("비밀번호는 영문,숫자,특수문자 혼합으로 사용해주세요.");
		 		return false;
		 		//문구 출력
		 	}
		 	if(eng==true && num==true && spe==true){
		 		alert("회원가입을 환영합니다.");
		 		return true;
		 		//모두가 입력되었을때 문구 출력
		}
	}
	$(document).ready(function(){
		$('#emailcheck').click(function() {
		// id가 emailcheck인 버튼을 클릭시 function 발동
			var email=$("#email").val(); // email안에 값을 받아오기 위한 변수선언
	      	 $.ajax({
	            type :'POST',
	            url :'${pageContext.request.contextPath}/emailcheck',
	            // 경로를 설정해주고 이름을 지정해준다.
	            data : {email : email},
	            datatype : 'xml',
	            success :function(result){
	                if($(result).find("check").text()=='yes'){
	                // check를 찾아서 null이면 사용가능한 이메일	
	                	alert("사용 가능한 이메일입니다.");
	                }else {
	                // check를 찾아서 null이 아니면 사용중인 이메일
	                    alert("사용중인 이메일입니다. 다른 이메일을 입력해 주세요");
	                }
	            }
	        });
	    });
	});
</script>
<div class="container">
  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href='${pageContext.request.contextPath}/'>Home</a>
    </li>
    <li class="breadcrumb-item active">Join</li>
  </ol>
  
  <div class="row">
    <div class="col-lg-8 mb-4">
      <h3>회원가입</h3><br>
      <form method="post" action="${pageContext.request.contextPath}/join" onsubmit="return pwdCheck();" name="check1" id="frm">
        <div class="control-group form-group">
          <div class="controls">
          	<p>
					<label>이메일</label>
					<input class="w3-input" type="text" id="email" name="email" required>
            </p>
            <input type="button" value="중복체크" class="btn btn-primary" id="emailcheck">
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
        <div class="control-group form-group">
          <div class="controls">
					<label>닉네임</label>
					<input class="w3-input" type="text" id="nickname" name="nickname" required>
		</div>
        </div>
        <div class="control-group form-group">
          <div class="controls">
					<label>전화번호</label>
					<input class="w3-input" type="text" id="phone" name="phone" required>
          </div>
        </div>
        <div id="success"></div>
        <button type="submit" class="btn btn-primary" id="sendMessageButton">회원가입 완료</button>
      </form>
    </div>
  </div>
</div>

