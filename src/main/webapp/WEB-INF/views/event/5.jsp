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
		width:500px;
		height:500px;
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
			<p style="font-size: 30px;">이미 캐시뽑기를 <br>
				진행하셨습니다.</p><br>
			<div id="1">
				<p>
					내 당첨금 :300캐시<br>
					2019-12-25<br>
					유효 기간 : 지급일로부터 1일<br>
				</p>
			</div>
		</div>
		<div id="button">
			<input type="button" value="확인" id="button1">	
		</div>
	</div>
	<div class="bottom">
		<p>당첨된 캐시는 더보기 메뉴 캐시내역에서 확인 하실 수 있습니다.<br>
			본 이벤트 캐시는 사용기간 내에 사용하지 않으면 소멸됩니다.</p>
  	</div>
  </div>