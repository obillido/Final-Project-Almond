<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:200px;   
      padding-bottom:100px;
      width:40%;
    }
    #nicknamediv{padding-left:40px;}
    #chknickname{margin-left:10px;}
</style>

<div id="container">
	<div class="card border-dark mb-3" style="max-width: 50rem;">
	  <div class="card-header">[<strong>${vo.nickname }</strong>]님의 프로필</div>
	  <div class="card-body text-dark">
		  <form method="post" action="${path }/mypage/chgprofile" enctype="multipart/form-data">
		    <h5 class="card-title">◈ 닉네임 변경</h5>
		    <div class="row" id="nicknamediv">
			    <input class="form-control" type="text" placeholder="변경할 닉네임을 입력하세요" name="nickname" id="nickname" style="width:300px;">
			    <button type="button" class="btn btn-link" style="border:0.5px solid gray;" id="chknickname">확인</button>
		    </div>
		    <br><br>
		    <h5 class="card-title">◈ 프로필 사진 변경</h5>
		    <c:choose>
		    <c:when test="${vo.profileimg eq null }">
		       <img src="${path }/resources/suhyeonimages/프로필기본.png" class="card-img-top" style="width:300px;padding-left:30px;">
		    </c:when>
		    <c:otherwise>
		       <img src="${path }/resources/profileimages/${vo.profileimg}" class="card-img-top" style="width:300px;padding-left:30px;">
		    </c:otherwise>
		    </c:choose>
		    <br><br>
		    <input type="file" name="file" style="padding-left:30px;">
		    <br><br>
		    <input type="submit" value="프로필 수정" class="btn btn-link" style="margin-left:550px;border:0.5px solid gray;">
		  </form>
	  </div>
	</div>
</div>

<script type="text/javascript">
var specialChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;

$(document).ready(function(){
	$("#chknickname").click(function(){
		var nickname=$("#nickname").val();
        
		if(nickname==""){
			alert("닉네임을 입력하세요.");
			return;
		}
		if(nickname.length>5){
			alert("닉네임을 5자 이하로 입력하세요.");
			return; 
		}
		if(nickname.match(specialChar)){
            alert("닉네임엔 특수문자를 사용할 수 없습니다.");
            return;
        }	
		alert("사용 가능한 닉네임입니다.");
	});
});
</script>