<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>  
    .back {
        background: linear-gradient(to top,#E8905E,#EE681B);
        width: 100%; height:900px; text-align: center; color: white;
        padding-top: 20px;
      }
    .bottom{
      	background-color: #E56E29; width: 100%; height: 120px;
      	color: white; text-align: center; padding-top: 20px;
      }
    #circle1 {
		background-color:#B03C02;
		z-index:10;
		width:450px;
		height:450px;
		border-radius:50%;	
		margin:0 auto;	
		margin-top: 100px;
		padding-top: 120px;
		}
	#circle1 .1{text-align:center;}
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
	#image{
 	 margin:50px 50px;z-index:20;
  	 width: 700px; height: 700px;
  	 top:290px;position:absolute;
  	 left: 560px;
	}
	#n_id{position:absolute;z-index:30;top:400px;
	left: 900px;}
	#start_btn{position:absolute;z-index:20;top:400px;
	left: 1100px;}
</style>

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
	<form action="/rullcash" method="post">
		<img src="${pageContext.request.contextPath }/resources/rull/pan1.png" id="image">
		<img src="${pageContext.request.contextPath }/resources/rull/pan2.png" id="n_id">
		<input type='button' value='시작' id='start_btn'></input>
		
		
			<p style="font-size: 30px;">이미 캐시뽑기를 <br>
				진행하셨습니다.</p><br>
			<div id="1">
				<p>
				<div id="result_id"></div>
				<div id="result_id2"></div>
				<div id="result_id3" name="cash1"></div>
				</p>
			</div>
		</div>
		<div id="button">
			<input type="submit" value="확인" id="button1">	
		</div>
	</div>
	<div class="bottom">
		<p>당첨된 캐시는 더보기 메뉴 캐시내역에서 확인 하실 수 있습니다.<br>
			본 이벤트 캐시는 사용기간 내에 사용하지 않으면 소멸됩니다.</p>
  	</div>
	</form>	
  </div>




<script src="${pageContext.request.contextPath }/resources/js/jQueryRotate.js"></script>
<script>
/* serpiko.tistory.com */
window.onload = function(){
     
    var cash = ["100","1000","200","500","100","200"];
 
    $('#start_btn').click(function(){
        rotation();
    });
 
    function rotation(){
        $("#image").rotate({
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
        $('#result_id').html("<p>움직인각도:" + n + "</p>");
        var real_angle = n%360 +30;//각도조절
        var part = Math.floor(real_angle/60);//360나누기 6칸 
     
        $('#result_id2').html("<p>상품범위:" + part + "</p>");
 
        if(part < 1){
            $('#result_id3').html("<p>내당첨금:" + cash[0] + "캐시</p>");
            return;
        }
 
        if(part >= 6){
            $('#result_id3').html("<p>내당첨금:" + cash[pArr.length-1] + "캐시</p>");
            return;
        }
 
        $('#result_id3').html("<p>내당첨금:" + cash[part] + "캐시</p>");
        $("#image").hide();
        $("#n_id").hide();
        $("#start_btn").hide();
    }
 
    function randomize($min, $max){
        return Math.floor(Math.random() * ($max - $min + 1)) + $min;
    }
};
</script>




















