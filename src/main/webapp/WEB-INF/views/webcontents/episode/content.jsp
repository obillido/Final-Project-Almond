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
  .bestmark{
		background-color:red;
		color:white;
		display:inline-block;
		padding-bottom:2px; margin-left:10px;
		width:50px;
		text-align:center;
		border-radius:5px;
	}
	
	
	#commList{width:100%;}
	.comm-regdate{float:right;}
	
	.tablink{
		width:50%;
	  background-color: white;
	  color: black;
	  float: left;
	  border: none;
	  outline: none;
	  cursor: pointer;
	  padding: 14px 16px;
	  font-size: 1.2em;
	}
	.tablink:hover{
		background-color:lightgrey;
	}
	.tabcontent{
	  color: black;
	  display: none;
	  padding: 50px;
	}
	.page-curr{background-color:lightgrey;}
	
</style>
	

<script type="text/javascript">
	$(document).ready(function(){

		document.getElementById("defaultOpen").click();
		
		
		$("#comment").click(function(){
			if(${empty usernum}){
				alert("로그인 후 이용가능한 서비스입니다.");
				$(this).blur();
			}
		});
		
		
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
		
		
		
	
		list(1);			
		$("#commInsert").click(function(){
			var comment=$("#comment").val();
			var ref=0;
			$.ajax({
				url:"${path}/webcontents/comments/insert",
				dataType:"xml",
				type:"post",
				data:{"epinum":${evo.epinum},"comment":comment,"ref":ref},
				success:function(data){
					if($(data).find("code").text()=='success'){
						$("#comment").val("");
						list(1);
						alert("댓글작성 완료");
					}else{
						alert("댓글작성 실패");
					}
				}
			});
		});
	});
	function list(pageNum){
		$("#bestCommList div").remove();
		$("#bestCommList hr").remove();
		$("#allCommList div").remove();
		$("#allCommList hr").remove();
		$.ajax({
			url:"${path}/webcontents/comments/list",
			dataType:"xml",
			type:"post",
			data:{"epinum":${evo.epinum},"pageNum":pageNum},
			success:function(data){
				$(data).find("bestComment").each(function(){
					$("#bestCommList").append(comm(this,1));
				});
				$(data).find("comment").each(function(){
					$("#allCommList").append(comm(this,0));
				});
				if($(data).find("bestComment").length==0){
					$("#bestCommList").append("<div><p>첫번째 Best댓글의 주인공이 되보세요.</p></div>");
				}
				if($(data).find("comment").length==0){
					$("#allCommList").append("<div><p>첫번째 댓글을 남겨주세요.</p></div>");
				}
				var pageNum=parseInt($(data).find("pageNum").text());
				var startPageNum=parseInt($(data).find("startPageNum").text());
				var endPageNum=parseInt($(data).find("endPageNum").text());
				var totalPageCount=parseInt($(data).find("totalPageCount").text());
				$("#allCommList").append(pagination(pageNum,startPageNum,endPageNum,totalPageCount));
			}
		});
	}
	function comm(me,type){
		var mt=$(me).find("mytype").text();
		var usernum=$(me).find("usernum").text();
		var comm=
			'<hr><div class="media mb-4"> '+
        '<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50"> '+
        '<div class="media-body"> '+
          '<h5 class="mt-0">'+$(me).find("nickname").text();
    if(type==1) comm+='<div class="bestmark">Best</div>';
    comm+='</h5> ';
		comm+='<p>'+$(me).find("content").text()+'</p> '+
					'<button onclick="clickLike(this,'+usernum+');" value="'+$(me).find("commnum").text()+'"';
		if(mt=='1') comm+='class="likes-click"> ';
		else 				comm+='class="likes"> ';
		comm+=	'<img src="${path}/resources/comments/like.png" class="likesImg"> '+
						'<div class="likesCnt">'+fmt($(me).find("cntlike").text())+'</div> '+
					'</button> '+
					'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '+
					'<button onclick="clickHate(this,'+usernum+')" value="'+$(me).find("commnum").text()+'" ';
		if(mt=='2') comm+='class="hates-click"> ';
		else 				comm+='class="likes"> ';
		comm+=	'<img src="${path}/resources/comments/hate.png" class="likesImg"> '+
						'<div class="likesCnt">'+fmt($(me).find("cnthate").text())+'</div> '+
					'</button> '+
					'<span class="comm-regdate">'+$(me).find("regdate").text()+'</span>'+
				'</div> '+
      '</div>';
      return comm;
	}
	function pagination(pageNum,startPageNum,endPageNum,totalPageCount){
		var paging='<div class="paging">'+
								'<ul class="pagination justify-content-center">';
		if(startPageNum!=1)
			paging+=		'<li class="page-item">'+
										'<a class="page-link" href="javascript:list('+(startPageNum-1)+')" aria-label="Previous">'+
											'<span aria-hidden="true">&laquo;</span>'+
											'<span class="sr-only">Previous</span>'+
										'</a>'+
									'</li>';
		for(var i=startPageNum; i<=endPageNum; i++){
			if(i!=pageNum) paging+='<li class="page-item"><a class="page-link" href="javascript:list('+i+')">'+i+'</a></li>';
			else paging+='<li class="page-item"><a class="page-link page-curr" href="javascript:list('+i+')">'+i+'</a></li>';
		}
		if(endPageNum!=totalPageCount)
			paging+=		'<li class="page-item">'+
										'<a class="page-link" href="javascript:list('+(endPageNum+1)+')" aria-label="Next">'+
											'<span aria-hidden="true">&raquo;</span>'+
											'<span class="sr-only">Next</span>'+
										'</a>'+
									'</li>';
		paging+='</ul></div>';
							
		return paging;
	}
	
	
	function fmt(x){
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function clickLike(me,usernum){
		if('${not empty usernum}'){
				if(${usernum}==usernum){
				if($($(me).parent().children()[3]).attr('class')=='likes'){
					if($(me).attr('class')=='likes'){
						if(changeLikesCnt($(me).val(),1,me)) $(me).attr('class','likes-click');
					}else{
						if(changeLikesCnt($(me).val(),-1,me))	$(me).attr('class','likes');
					}
				}else{
					 alert("이미 '싫어요'를 누르셨습니다.");
				}
			}else{
				alert("본인의 댓글입니다.");
			}
		}else{
			alert("로그인 후 이용가능한 서비스입니다.");
		}
	}
	function clickHate(me,usernum){
		if('${not empty usernum}'){
			if(${usernum}==usernum){
				if($($(me).parent().children()[2]).attr('class')=='likes'){
					if($(me).attr('class')=='likes'){
						if(changeLikesCnt($(me).val(),2,me)) $(me).attr('class','hates-click');
					}else{
						if(changeLikesCnt($(me).val(),-2,me)) $(me).attr('class','likes');
					}
				}else{
					alert("이미 '좋아요'를 누르셨습니다.");
				}
			}else{
				alert("본인의 댓글입니다.");
			}
		}else{
			alert("로그인 후 이용가능한 서비스입니다.");
		}
	}
	
	function changeLikesCnt(commnum,type,me){
		var check=true;
		$.ajax({
			url:"${path}/webcontents/comments/changeLikesCnt",
			dataType:"xml",
			type:"post",
			data:{"commnum":commnum,"type":type},
			success:function(data){
				console.log("들어오나?")
				if($(data).find("owner").text()=='mine'){
					alert("본인의 댓글입니다.");
				}else{
					if($(data).find("code").text()=='success'){
						console.log($(data).find("cnt").text());
						$(me).children().last().html('<div class="likesCnt">'+fmt($(data).find("cnt").text())+'</div> ');
						check= true;
					}else{
						alert("오류발생!");
					}
				}
			}			
		});
		return ch;
	}
	
	
	
	function openComm(commName,elmnt){
		var i, tabcontent, tablinks;
		tabcontents=$(".tabcontent");
		for(i=0; i<tabcontents.length; i++){
			tabcontents[i].style.display="none";
		}
		tablinks=$(".tablink");
		for(i=0; i<tablinks.length; i++){
			tablinks[i].style.backgroundColor="";
		}
		$("#"+commName).css("display","block");
		elmnt.style.backgroundColor="lightgrey";
	}
	

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
	
	<c:choose>
		<c:when test="${empty episcore}">
			<p>아직 아무도 별점을 주지 않았습니다.</p>
		</c:when>
		<c:otherwise>
			<p>이번 화의 평균 별점은 <strong>${episcore}</strong>점입니다.</p>
		</c:otherwise>
	</c:choose>
	
	고객님의 소중한 별점을 주세요 :)
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
	
	
	
	<div class="row" style="width:100%;">
      
    <div class="card my-4" style="width:100%;">
      <h5 class="card-header">독자님! 한마디 남겨주세요.</h5>
      <div class="card-body">
        <div class="form-group">
          <textarea class="form-control" rows="3" id="comment"></textarea>
        </div>
        <button id="commInsert" class="btn btn-primary">등록</button>
      </div>
    </div>



		<div id="commList">
			<button class="tablink" onclick="openComm('bestCommList',this)" id="defaultOpen">Best 댓글</button>
			<button class="tablink" onclick="openComm('allCommList',this)">전체댓글</button>
			
			<div id="bestCommList" class="tabcontent"></div>
			<div id="allCommList" class="tabcontent"></div>
		</div>
	</div>

</div>