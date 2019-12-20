<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
 <link href="${pageContext.request.contextPath}/resources/gift/giftlist1.css" rel="stylesheet">
 
    

<div class="wrap">
	<div class="d1">

		<div class="container">

			<h1 class="mt-4 mb-3">
				Gift <small>등록</small>
			</h1>

			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/">홈</a></li>
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/gift/gift">타입선택</a>
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
					<form method="post" action="${pageContext.request.contextPath}/gift/regi" enctype="multipart/form-data">
						<input type="hidden" name="cultype" value="${cultype}">
						<div class="control-group form-group">
							<div class="controls">
								<label>작품명 :</label> 
								<select class="form-control" name="contnum">
									<c:forEach var="vo" items="${gvo}">
										<option value="${vo.contnum}">${vo.title}</option>
									
									</c:forEach>
								</select>
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>이용권 (종류) :</label> <select class="form-control" name="type">
									<option value="1">소장권</option>
									<option value="2">대여권</option>
								</select>
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>이용권 (개수) :</label> 
									<input type="number" min="0" class="form-control" name="cnt" 
									required data-validation-required-message="갯수를 선택하세요." autocomplete=off>
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>시작일 :</label> <input type="date" class="form-control"
									name="startdate" required
									data-validation-required-message="날짜(시작)을 선택하세요."
									autocomplete=off>
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>종료일 :</label> <input type="date" class="form-control"
									name="enddate" required
									data-validation-required-message="날짜(종료)을 선택하세요."
									autocomplete=off>
								<p class="help-block"></p>
							</div>
						</div>
						<button type="submit" class="btn btn-primary">등록</button>
					</form>
				</div>
			</div>
		</div>
		
	</div>
</div>    