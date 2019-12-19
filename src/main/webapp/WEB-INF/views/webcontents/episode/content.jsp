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
    #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>
	

<script type="text/javascript">
	$(document).ready(function(){
		/////////별점/////////
		var stars;
		$("#star_grade a").removeAttr("href");
		$("#star_grade a").click(function(){
            $(this).parent().children("a").removeClass("on"); 
            $(this).addClass("on").prevAll("a").addClass("on");
            stars=$(this).attr("value");
            
		});
        $("#score").click(function(){
			$.ajax({
				url:"${path}/webcontents/score?stars=" + stars + "&epinum=${evo.epinum}",
				dataType:"xml",
				success:function(data){
					if($(data).find("code").text()=='성공'){
						alert("별점이 반영되었습니다.");
					}else if($(data).find("code").text()=='실패'){
						alert("요청작업에 실패했습니다.");
					}else{
						alert("이미 별점을 주셨었습니다.");
					}
					
				}
			});
		});
		
		
		
		
		
	
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
		$("#commList div").remove();
		$.ajax({
			url:"${path}/webcontents/comments/list?epinum=${evo.epinum}&usernum=${usernum}",
			dataType:"xml",
			success:function(data){
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
					else 				comm+='class="likes"> ';
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
		if($(me).parent().children().last().attr('class')=='likes'){
			if($(me).attr('class')=='likes'){
				changeLikesCnt($(me).val(),1,me)
				$(me).attr('class','likes-click');
			}else{
				changeLikesCnt($(me).val(),-1,me);
				$(me).attr('class','likes');
			}
		}else{
			 alert("이미 '싫어요'를 누르셨습니다.");
		}
	}
	function clickHate(me){
		if($($(me).parent().children()[2]).attr('class')=='likes'){
			if($(me).attr('class')=='likes'){
				changeLikesCnt($(me).val(),2,me);
				$(me).attr('class','hates-click');
			}else{
				changeLikesCnt($(me).val(),-2,me);
				$(me).attr('class','likes');
			}
		}else{
			alert("이미 '좋아요'를 누르셨습니다.");
		}
	}
	
	function changeLikesCnt(commnum,type,me){
		$.ajax({
			url:"${path}/webcontents/comments/changeLikesCnt",
			dataType:"xml",
			type:"post",
			data:{"usernum":${usernum},"commnum":commnum,"type":type},
			success:function(data){
				if($(data).find("code").text()=='success'){
					$(me).children().last().html('<div class="likesCnt">'+fmt($(data).find("cnt").text())+'</div> ');
				}else{
					alert("오류발생!");
				}
			}			
		});
	}
	
	
	
	// 댓글 스크립트

</script>
	




<!-- Page Content -->
 <div class="container">

<br>


	<div style="text-align:center">
		<img src="${path}/resources/webcontents/${wvo.cultype}/${evo.img}">
  </div>



	<hr>

<!-- ////////// 별점 ////////// -->
<br>
이번 화의 평균 별점은 <strong>${episcore }</strong>입니다.
<br>
고객님께서도 소중한 별점을 주세요 :)
이번 화는 5점 만점에 몇 점~~~?&nbsp;&nbsp;
<p id="star_grade" style="display:inline-block;font-size: 1.5em;">
  <a href="#" value="1">★</a>
  <a href="#" value="2">★</a>
  <a href="#" value="3">★</a>
  <a href="#" value="4">★</a>
  <a href="#" value="5">★</a>
</p>&nbsp;&nbsp;
<button id="score" class="btn btn-outline-secondary" style="display:inline-block">별점 주기</button>	



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