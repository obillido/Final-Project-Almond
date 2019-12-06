<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
  
  <div class="container">

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

    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>      	
        	<c:choose>
	      		<c:when test="${cultype==1}">웹툰/만화</c:when>
	      		<c:when test="${cultype==2}">웹소설</c:when>
	      		<c:when test="${cultype==3}">예능</c:when>
	      		<c:when test="${cultype==4}">드라마</c:when>
	      		<c:when test="${cultype==5}">영화</c:when>
      		</c:choose>
      	</h3>
      	<br>
        <form method="post" action="${pageContext.request.contextPath}/webcontents/regi" enctype="multipart/form-data">
        	<input type="hidden" name="cultype" value="${cultype}"> 
          <div class="control-group form-group">
            <div class="controls">
              <label>작품명 :</label>
              <input type="text" class="form-control" name="title" required data-validation-required-message="장르를 입력해주세요." autocomplete=off>
              <p class="help-block"></p>
            </div>
          </div>
					<c:choose>
						<c:when test="${cultype<=2}">
							<div class="control-group form-group">
		            <div class="controls">
		              <label>글작가 :</label>
		              <input type="text" class="form-control" name="writer" required data-validation-required-message="글작가를 입력해주세요." autocomplete=off>
		              <p class="help-block"></p>
		            </div>
		          </div>
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>그림작가 :</label>
		              <input type="text" class="form-control" name="illustrator" required data-validation-required-message="그림작가를 입력해주세요." autocomplete=off>
		              <p class="help-block"></p>
		            </div>
		          </div>
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>출판사 :</label>
		              <input type="text" class="form-control" name="publisher" required data-validation-required-message="출판사를 입력해주세요." autocomplete=off>
		              <p class="help-block"></p>
		            </div>
		          </div>
						</c:when>
						<c:otherwise>
							<div class="control-group form-group">
		            <div class="controls">
		              <label>감독 :</label>
		              <input type="text" class="form-control" name="director" required data-validation-required-message="감독을 입력해주세요." autocomplete=off>
		              <p class="help-block"></p>
		            </div>
		          </div>
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>출연진 :</label>
		              <input type="text" class="form-control" name="actor" required data-validation-required-message="출연진을 입력해주세요." autocomplete=off>
		              <p class="help-block"></p>
		            </div>
		          </div>
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>상영시간 (분) :</label>
		              <input type="number" class="form-control" name="runtime" required data-validation-required-message="상영시간을 입력해주세요." autocomplete=off>
		              <p class="help-block"></p>
		            </div>
		          </div>	
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>제작일 :</label>
		              <input type="date" class="form-control" name="proddate" required data-validation-required-message="제작일을 입력해주세요." autocomplete=off>
		              <p class="help-block"></p>
		            </div>
		          </div>					
						</c:otherwise>
					</c:choose>
          <div class="control-group form-group">
            <div class="controls">
              <label>장르 :</label>
              <select class="form-control" name="genre">
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
              <select class="form-control" name="tknum">
	              <c:forEach var="tk" items="${ticketList}">
	              	<option value="${tk.tknum}">
	              		<c:choose>
	              			<c:when test="${cultype==1}">대여권 ${tk.cnt1}개 : ${tk.rentalprice1}원, 대여권 ${tk.cnt2}개 : ${tk.rentalprice2}원, 대여권 ${tk.cnt3}개 : ${tk.rentalprice3}원<br> 소장권 ${tk.cnt1}개 : ${tk.ownprice1}원, 소장권 ${tk.cnt2}개 : ${tk.ownprice2}원, 소장권 ${tk.cnt3}개 : ${tk.ownprice3}원</c:when>
	              			<c:when test="${cultype==2}">소장권 ${tk.cnt1}개 : ${tk.ownprice1}원, 소장권 ${tk.cnt2}개 : ${tk.ownprice2}원, 소장권 ${tk.cnt3}개 : ${tk.ownprice3}원</c:when>
	              			<c:when test="${cultype==3||cultype==4}">대여권 ${tk.cnt1}개 : ${tk.rentalprice1}원, 대여권 ${tk.cnt2}개 : ${tk.rentalprice2}원, 대여권 ${tk.cnt3}개 : ${tk.rentalprice3}원</c:when>
	              			<c:when test="${cultype==5}">대여권 : ${tk.rentalprice1}원, 소장권 : ${tk.ownprice1}원</c:when>
	              		</c:choose>
	              	</option>
	              </c:forEach>
              </select>
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>기다리면 무료 시간 :</label>
              <select class="form-control" name="waiting">
								<option value="-1">유료</option>    
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
              <label>연령등급 :</label>
              <select class="form-control" name="agegrade">
								<option value="0">전체연령가</option>              
								<option value="12">12세</option>              
								<option value="15">15세</option>              
								<option value="19">19세</option>              
              </select>
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>무료회차 :</label>
              <input type="number" class="form-control" value="0" name="freenum" required data-validation-required-message="무료회차를 입력해주세요." autocomplete=off>
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>완결여부 :</label>
              <select class="form-control" name="completiontype">
								<option value="0">연재중</option>              
								<option value="1">완결</option>           
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
	        <div class="control-group form-group">
	            <div class="controls">
	              <label>이미지 :</label>
	              <input type="file" class="form-control" name="file1">
	              <p class="help-block"></p>
	            </div>
          </div>
          <button type="submit" class="btn btn-primary">등록</button>
        </form>
      </div>
    </div>

  </div>
