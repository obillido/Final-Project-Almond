<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<style>
	.likes{width:80px; display:inline-block; padding:2px; background-color:white; border:1px solid black;}
	.likes-click{width:80px; display:inline-block; padding:2px; background-color:white; border:2px solid blue; color:blue;}
	.hates-click{width:80px; display:inline-block; padding:2px; background-color:white; border:2px solid red; color:red;}
	.likesImg{width:18px; }
	.likesCnt{display:inline-block; width:45px; margin:0px 2px; text-align:center;}
</style>
	

<script type="text/javascript">
	$(document).ready(function(){
		list();			
		
		$("#commInsert").click(function(){
			var comment=$("#comment").val();
			var ref=0;
			$.ajax({
				url:"${path}/webcontents/comments/insert",
				dataType:"xml",
				type:"post",
				data:{"epinum":${evo.epinum},"usernum":${usernum},"comment":comment,"ref":ref},
				success:function(data){
					console.log($(data).find("code").text());
					if($(data).find("code").text()=='success'){
						$("#comment").val("");
						list();
						alert("댓글작성 완료");
					}else{
						alert("댓글작성 실패");
					}
				}
			});
		});
	});
	function list(){
		$.ajax({
			url:"${path}/webcontents/comments/list?epinum=${evo.epinum}&usernum=${usernum}",
			dataType:"xml",
			success:function(data){
				$("#commList div").remove();
				$(data).find("comment").each(function(){
					var mt=$(this).find("mytype").text();
					var comm=
						'<div class="media mb-4"> '+
			        '<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50"> '+
			        '<div class="media-body"> '+
			          '<h5 class="mt-0">'+$(this).find("nickname").text()+'</h5> '+
								'<p>'+$(this).find("content").text()+'</p> '+
								'<button onclick="clickLike(this);" value="'+$(this).find("commnum").text()+'"';
					if(mt=='1') comm+='class="likes-click"> ';
					else 				comm+='class="likes"> ';
					comm+=	'<img src="${path}/resources/comments/like.png" class="likesImg"> '+
									'<div class="likesCnt">'+fmt($(this).find("cntlike").text())+'</div> '+
								'</button> '+
								'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '+
								'<button onclick="clickHate(this)" value="'+$(this).find("commnum").text()+'" ';
					if(mt=='2') comm+='class="hates-click"> ';
					else 			comm+='class="likes"> ';
					comm+=	'<img src="${path}/resources/comments/hate.png" class="likesImg"> '+
									'<div class="likesCnt">'+fmt($(this).find("cnthate").text())+'</div> '+
								'</button> '+
							'</div> '+
			      '</div> <hr> ';
					$("#commList").append(comm);
				});
			}
			
		});
	}
	
	function fmt(x){
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function clickLike(me){
		if($(me).attr('class')=='likes'){
			$(me).attr('class','likes-click');
			changeLikesCnt($(me).val(),1,me);
		}else{
			$(me).attr('class','likes');
			changeLikesCnt($(me).val(),-1,me);
		}
	}
	function clickHate(me){
		if($(me).attr('class')=='likes'){
			$(me).attr('class','hates-click');
			changeLikesCnt($(me).val(),2,me);
		}else{
			$(me).attr('class','likes');
			changeLikesCnt($(me).val(),-2,me);
		}
	}
	
	function changeLikesCnt(commnum,type,me){
		$.ajax({
			url:"${path}/webcontents/comments/changeLikesCnt",
			dataType:"xml",
			type:"post",
			data:{"usernum":${usernum},"commnum":commnum,"type":type},
			success:function(data){
				var code=$(data).find("code").text();
				console.log($(me));
				$(me).text("");
			}			
		});
	}
</script>
	




<!-- Page Content -->
 <div class="container">

<br>
	<ol class="breadcrumb">
	  <li class="breadcrumb-item active">
	   <c:choose>
				<c:when test="${wvo.cultype==1}">만화</c:when>
				<c:when test="${wvo.cultype==2}">소설</c:when>
				<c:when test="${wvo.cultype==3}">예능</c:when>
				<c:when test="${wvo.cultype==4}">드라마</c:when>
				<c:when test="${wvo.cultype==5}">영화</c:when>
			</c:choose>
		</li>
	  <li class="breadcrumb-item active">${wvo.title}</li>
	  <li class="breadcrumb-item active">${evo.subtitle}</li>
	</ol>
	
	
	
	
	<div style="text-align:center">
		<img src="${path}/resources/webcontents/${wvo.cultype}/${evo.img}">
  </div>



	<hr>


	
	<div class="row">
    <div class="col-lg-8">
      <!-- Comments Form -->
      
      <div class="card my-4">
        <h5 class="card-header">독자님! 한마디 남겨주세요.</h5>
        <div class="card-body">
          <div class="form-group">
            <textarea class="form-control" rows="3" id="comment"></textarea>
          </div>
          <button id="commInsert" class="btn btn-primary">등록</button>
        </div>
      </div>



			<div id="commList">
	
	      <!-- Comment with nested comments -->
	      <div class="media mb-4">
	        <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	        <div class="media-body">
	        
	          <h5 class="mt-0">Commenter Name</h5>
						댓글내용
	
	          <div class="media mt-4">
	            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	            <div class="media-body">
	              <h5 class="mt-0">Commenter Name</h5>
								댓글내용
	            </div>
	          </div>

					</div>
        </div>
        
      </div>
	  </div>
	</div>
	
	


</div>