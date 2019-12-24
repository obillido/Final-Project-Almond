<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>  
    .back {
        background: linear-gradient(to top,#E8905E,#EE681B);
        width: 100%; height:900px; text-align: center; color: white;
        padding-top: 20px;margin: 0px auto;position: relative;
      }
    .bottom{
      	background-color: #E56E29; width: 100%; height: 120px; 
      	color: white; text-align: center; padding-top: 30px;
      	margin-top: 222px;
      }
    .back #circle1 {
		background-color:#B03C02;
		z-index:10;
		width:350px;
		height:350px;
		border-radius:50%;	
		
		margin:0 auto;	
		margin-top: 100px;
		position: relative; 
		}
	 .back #content{text-align: center;z-index:10;position: absolute; 
	 left: 70px; top: 100px;}
	
	.back #circle2 {
		width: 150%; margin: 0px auto;
		 z-index:30;
		 position: relative; 
	}
	 #circle2 #pan{
 	 z-index:40;
  	 width: 120%; height: auto;	
  	 position: absolute; left: -130px; top: -100px;
	}
	#niddle{z-index:50; width: 50%; height: auto;
	text-align: center;
	position: absolute;left:55px;top:-55px;
	}
	#amonde{z-index:50; width: 15%; 
	text-align: center; position: absolute; left:143px; top:178px;
	}
	 
	
	#button {margin-top: 100px;}
	.back .title{margin-top: 50px;}
	#button1 {
		background-color: #B03C02;
		border: none;
		color: white;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		cursor: pointer;
		width: 40%;
	}
	
	
</style>

<script src="${pageContext.request.contextPath }/resources/js/jQueryRotate.js"></script>
<script>
/* serpiko.tistory.com */
window.onload = function(){
		
    var cash = ["100","1000","200","500","100","200"];
    $('#start_btn').click(function(){
    	if(${empty usernum}){
			alert("로그인 후 이용할 수 있는 서비스입니다.");
		}else if(${already=="true"}){
			alert("이미 캐시뽑기를 진행하셨습니다.");
		}else{
	        rotation();
		}
    });
    function rotation(){
        $("#pan").rotate({
          angle:0,
          animateTo:360 * 6 + randomize(0, 360),
          center: ["50%", "50%"],
          easing: $.easing.easeInOutElastic,
          callback: function(){
                        var n = $(this).getRotateAngle();
                        endAnimate(n);
                    },
          duration:5000
       });
    } 
    function endAnimate($n){
        var n = $n;	
      //  $('#result_id').html("<p>움직인각도:" + n + "</p>");
        var real_angle = n%360 +30;//각도조절
        var part = Math.floor(real_angle/60);//360나누기 6칸 
     
      //  $('#result_id2').html("<p>상품범위:" + part + "</p>");
 
        if(part < 1){
            $('#cash1').html("<p>내당첨금:" + cash[0] + "캐시</p>");       
            return;
        }
 
        if(part > 5){
            $('#cash1').html("<p>내당첨금:" + cash[0] + "캐시</p>");
            return;
        }
 
        $('#cash1').html("<p>내당첨금:" + cash[part] + "캐시</p>");
        $("#pan").hide();
        $("#niddle").hide();
        $("#start_btn").hide();


		

		$.ajax({
			url:"${pageContext.request.contextPath }/event5/cash",
			type:"post",//post방식으로 요청하기
			data:{"price":cash[part],"eventnum":'${eventnum}'},
			dataType:"xml",
			success:function(data){
				var find=$(data).find("find").text();
				if(find=='true'){
					
					alert($(data).find("success").text());
				}else if(find=='fail'){
					alert($(data).find("fail").text());
				}else if(find=='jungbock'){
					alert($(data).find("jungbock").text());
				}else if(find=='sorry'){
					alert($(data).find("sorry").text());
				}	
			}
    	});
    }
 
    function randomize($min, $max){
        return Math.floor(Math.random() * ($max - $min + 1)) + $min;
    }
    
};
</script>



<div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">캐시뽑기권</h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">알림페이지</a>
      </li>
    </ol>
	<div class="back">
    	<div id="title">
    		<h3>꽝없는</h3>
			<h1>캐시뽑기!</h1>
		</div>
		<div id="circle1">
			<div id="circle2">		
				<img src="${pageContext.request.contextPath }/resources/rull/10001.png" id="pan">
				<div id="niddle"><img src="${pageContext.request.contextPath }/resources/rull/pan2.png" ></div>
				<button id="start_btn" type="button"><img src="${pageContext.request.contextPath }/resources/rull/아몬드.png" id="amonde"></button>
			</div>			
			<div id="content">	
				<p style="font-size: 30px;">이미 캐시뽑기를 <br>
				진행하셨습니다.</p><br>							
				<div id="cash1"></div>				
			</div>
			
		</div>	
		
		<div class="bottom">
			<p>당첨된 캐시는 더보기 메뉴 캐시내역에서 확인 하실 수 있습니다.<br>
				본 이벤트 캐시는 사용기간 내에 사용하지 않으면 소멸됩니다.</p>
  		</div>	
	</div>	
</div>

























