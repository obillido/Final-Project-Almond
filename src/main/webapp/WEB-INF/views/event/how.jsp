<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.container #wrap
{  background-color:#ffffff;  position: relative; overflow: hidden;}
.container #wrap #gameContainer
{width:508px; height:671px; text-align: center; position: relative;margin:0px auto;}
.container #wrap #gameContainer .obj
{position: absolute;}
.container #wrap #gameContainer .board_start
{width:177px; height:177px; top:195px; left:165px; z-index: 5;}
.container #wrap #gameContainer .board_start img
{width:100%;}
.container #wrap #gameContainer .board_bg
{width:508px; height:508px; top:40px; left:0px; z-index: 2;}
.container #wrap #gameContainer .board_bg img
{width:100%;}
.container #wrap #gameContainer .board_on
{width:508px; height:508px; top:40px; left:0px; z-index: 3; background-image: url('//img.babathe.com/upload/specialDisplay/htmlImage/2019/test/roulette_circle_bg.png');    background-size: 508px;
}

.container #wrap #gameContainer .board_on img
{position:absolute; width:100px;top:115px; height:100px;}
.container #wrap #gameContainer .board_on img:nth-child(1)
{    left: 55px;  transform: rotate( -60deg );  top: 120px;}
.container #wrap #gameContainer .board_on img:nth-child(2)
{left: 62px;  transform: rotate( -113deg );  top: 286px;  }
.container #wrap #gameContainer .board_on img:nth-child(3)
{  left: 208px;  top: 372px; transform: rotate(-180deg);}  
.container #wrap #gameContainer .board_on img:nth-child(4)
{left: 351px; top: 286px;  transform: rotate(-245deg);}
.container #wrap #gameContainer .board_on img:nth-child(5)
{ left: 351px;  top: 125px;  transform: rotate(-292deg); }
.container #wrap #gameContainer .board_on img:nth-child(6)
{  left: 205px;  top: 42px;  transform: rotate(5deg); }  

.container #wrap #gameContainer .obj.board_arrow
{width:90px; height:105px; top:0px; left:195px; z-index: 5;}
.container #wrap #gameContainer .char1
{width:259px; height:246px; top:400px; left:90px; z-index: 1;}
.container #wrap #gameContainer .char2
{width:175px; height:198px; top:449px; left:600px; z-index: 1;}
.container #wrap #gameContainer .char3
{width:112px; height:108px; top:540px; left:550px; z-index: 3;}
.container #wrap #gameContainer .txt1
{width:420px; height:30px; bottom:20px; left:260px; z-index: 3;}

.popup 
{display: none; position: fixed; left: 50%; z-index: 99999; text-align: center; background:#fff; font-size:20px; color:#000;}
#fade 
{display: none;background: #000;position: fixed;left: 0;top: 0;width: 100%;height: 100%;opacity: .60;z-index: 9999;}
#popup_gift
{width:475px; height:505px; top:120px;}
#popup_gift .lottery_present 
{text-align:center;}
#popup_gift .lottery_present img
{ display:block; margin: 50px auto 30px;}
#popup_fail
{width:475px; height:505px; top:120px;}
.popup  .close
{ display:inline-block; width:150px; hegiht:50px; line-height:50px; color:#fff; background:#333; margin: 30px 0 0;}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script>
$(document).ready(function() {
    var gift;   
    var  present =[ 1,2,3,4,5,6 ]

    iniGame = function(num){
        gift = num;
                   
        $(".board_start").html('<img src="images/roulette_board_go.png">');
        TweenLite.killTweensOf($(".board_on"));
        TweenLite.to($(".board_on"), 0, {css:{rotation:rotationPos[gift]}});
        TweenLite.from($(".board_on"),5, {css:{rotation:-3000}, onComplete:endGame, ease:Sine.easeOut});
               console.log("gift 숫자 : "+ (gift +1) );
    }
    
    var rotationPos = new Array(60,120,180,240,300,360 );
    TweenLite.to($(".board_on"), 60, {css:{rotation:-4000}, ease: Linear.easeNone});
    
    function endGame(){
              var  copImg= "${pageContext.request.contextPath }/resources/eventTK"+( gift +1) + "캐시.png";
                console.log("이미지 : " + copImg );
    
                     $("#popup_gift .lottery_present" ).text(function( ) {   return "축하드립니다."+present [gift ] + " 룰렛숫장"+ ( gift +1)   + " 당첨 되셨습니다.";    });
                          $( '<img  src="' + copImg+ '" />' ).prependTo("#popup_gift .lottery_present");

  setTimeout(function() {openPopup("popup_gift");   }, 1000); }
    
    $(".popup .btn").on("click",function(){
        location.reload();
    });

    function openPopup(id) {
        closePopup();
        $('.popup').slideUp(0);
        var popupid = id
        $('body').append('<div id="fade"></div>');
        $('#fade').css({
        'filter' : 'alpha(opacity=60)'
        }).fadeIn(300);
        var popuptopmargin = ($('#' + popupid).height()) / 2;
        var popupleftmargin = ($('#' + popupid).width()) / 2;
        $('#' + popupid).css({
            'margin-left' : -popupleftmargin
        });
        $('#' + popupid).slideDown(500);
    }
    function closePopup() {
        $('#fade').fadeOut(300, function() {
            // $(".player").html('');
        });
        $('.popup').slideUp(400);
        return false
    }
    $(".close").click(closePopup);

});

$(function() {
	var clicked  =0;
	for(i=100; i<1000; i++){

  var  pictures = "${pageContext.request.contextPath }/resources/eventTK"+ i  + "캐시.png"; 
  $(".board_on").append('<img  src="' + pictures + '" />');

}
$(".join").on("mousedown",function(){                                   
  if( clicked <= 0){    iniGame(Math.floor(Math.random() *6));    }

  else  if( clicked >=1 ){    event.preventDefault(); alert( "이벤트 참여 하셨씁니다."); }                                           
  clicked ++
});
            })
</script>
<div class="container">
	<div id="wrap">
		<!-- 룰렛돌아가는거 상품...넣기...? -->
		<div id="gameContainer">                
		                <div class="board_start obj">
		                	<img src="http://img.babathe.com/upload/specialDisplay/htmlImage/2019/test/coupon_button.png" class="join">
		                </div>
		                <div class="board_bg obj">
		                	<img src="http://img.babathe.com/upload/specialDisplay/htmlImage/2019/test/roulette_circle_bg.png">
		                </div>
		                <div class="board_on obj">
			                <img src="${pageContext.request.contextPath }/resources/eventTK/100캐시.png">
			                <img src="${pageContext.request.contextPath }/resources/eventTK/200캐시.png">
			                <img src="${pageContext.request.contextPath }/resources/eventTK/500캐시.png">
			                <img src="${pageContext.request.contextPath }/resources/eventTK/200캐시.png">
			                <img src="${pageContext.request.contextPath }/resources/eventTK/100캐시.png">
			                <img src="${pageContext.request.contextPath }/resources/eventTK/1000캐시.png">
		                
		                </div>
		                <div class="board_arrow obj"><img src="http://img.babathe.com/upload/specialDisplay/htmlImage/2019/test/roulette_board_arrow.png"></div>
		            
		</div>
		<!-- 당첨된상품뜨는 팝업창 -->
		<div id="popup_gift" class="popup">
		    <div class="lottery_present"></div>
		        <a href="javascript:;" class="close">닫기 </a>
		</div>
	</div>
</div>