<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
  
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Webcontents
      <small>등록</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/">홈</a>
      </li>
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/webcontents/choice">타입선택</a>
      </li>
      <li class="breadcrumb-item active">등록</li>
    </ol>

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>      	
        	<c:choose>
	      		<c:when test="${cultype==1}">웹툰/만화</c:when>
	      		<c:when test="${cultype==1}">웹소설</c:when>
	      		<c:when test="${cultype==1}">영화</c:when>
	      		<c:when test="${cultype==1}">드라마</c:when>
	      		<c:when test="${cultype==1}">예능</c:when>
      		</c:choose>
      	</h3>
      	<br>
        <form id="contactForm" novalidate>
          <div class="control-group form-group">
            <div class="controls">
              <label>작품명 :</label>
              <input type="text" class="form-control" name="title" required data-validation-required-message="장르를 입력해주세요." autocomplete=off>
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>장르 :</label>
              <select class="form-control" name="genre" required data-validation-required-message="장르를 선택해주세요.">
	              <option value="">선택</option>
	              <c:forEach var="genre" items="${genreList}">
	              	<option value="${genre}">${genre}</option>
	              </c:forEach>
              </select>
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>가격 :</label>
              <select class="form-control" name="tknum" required data-validation-required-message="를 선택해주세요.">
	              <option value="">선택</option>
	              <c:forEach var="tk" items="${ticketList}">
	              	<option value="${tk.tknum}">대여권 ${tk.cnt1}개 : ${tk.rentalprice1}원, 대여권 ${tk.cnt2}개 : ${tk.rentalprice2}원, 대여권 ${tk.cnt3}개 : ${tk.rentalprice3}원, 소장권 ${tk.cnt1}개 : ${tk.ownprice1}원, 소장권 ${tk.cnt2}개 : ${tk.ownprice2}원, 소장권 ${tk.cnt3}개 : ${tk.ownprice3}원,   </option>
	              </c:forEach>
              </select>
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>기다리면 무료 시간 :</label>
              <select class="form-control" name="waiting" required data-validation-required-message="장르를 입력해주세요.">
								<option value="-1">유료</option>
								<option value="0">무료</option>
								<option value="1">1시간</option>              
								<option value="12">12시간</option>              
								<option value="24">1일</option>              
								<option value="48">2일</option>              
								<option value="72">3일</option>              
								<option value="168">7일</option>              
              </select>
              <p class="help-block"></p>
            </div>
          </div>
          
          
          
          
          
          
          <div class="control-group form-group">
            <div class="controls">
              <label>줄거리(소개글):</label>
              <textarea rows="10" cols="100" class="form-control" name="outline" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Send Message</button>
        </form>
      </div>

    </div>
    <!-- /.row -->

  </div>
