<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#main{ width:100%; $pW: 720; max-width:720px; margin:0 auto;}
.roulette_area{ display: table; text-align: center; width:100%;}
.roulette_box{ display:table-cell; vertical-align: middle;}
.roulette_center{ position: relative; width:100%; padding-bottom:100%; margin:pImg( 100, $pW ) 0 0 pImg( 30, $pW );}
.btn_start{ display:block; width:10%; position: absolute; margin-left: 470px; 
				margin-top: 270px; z-index: 2;}
.roll_bg{ position: absolute; top:0; left:0; width:70% }
</style>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>




<div id="container">
<main id="wrap">
	<div class="roulette_area">
		<div class="roulette_box">
			<div class="roulette_center">
				<a href="javascript:;" class="btn_start"><img src="${pageContext.request.contextPath }/resources/rull/start.png" alt="버튼"></a>
					<img src="${pageContext.request.contextPath }/resources/rull/pan.png" class="roll_bg" alt="룰렛이미지">
			</div>
		</div>
	</div>
</main>
</div>
<script>
var _btnStart;
var _roll_bg;
var _items;
var _mTime;
function init()
{
create();
addEvent();
}

function create()
{
_btnStart = $( ".btn_start" );
_roll_bg = $( ".roll_bg" );
_items = [ "포인트 30P", "할인쿠폰 10%", "무료반품 FREE", "할인쿠폰 30%"];
_mTime = 1;
}

function addEvent()
{
_btnStart.on( "click", btnStartClick );
}

function btnStartClick( $e )
{
spinMotion();
}

var _count = 0;
//움직이는 모션
function spinMotion()
{
TweenMax.to( _roll_bg, _mTime, { rotation:360, ease:Power0.easeInOut, onComplete:function(){
TweenMax.set( _roll_bg, { rotation:0 });
_count ++;
if( _count > 0 ){
randomValue();
return;
}
spinMotion();
}});
}
//결과값 추출
function randomValue(){
var ran = parseInt( Math.random() * _items.length );
angleCount( ran );
}
//결과값 맞게 움직이는 모션
function angleCount( $ran )
{
TweenMax.killTweensOf( _roll_bg );
TweenMax.set( _roll_bg, { rotation:0 });

var angle = 360 / _items.length;
TweenMax.to( _roll_bg, _mTime, { rotation: $ran * angle , ease:Power0.easeInOut, onComplete:function(){
alert( _items[ $ran ] + " 당첨 되었습니다" );
}});
}

$( document ).ready( function(){
init();
});
</script>