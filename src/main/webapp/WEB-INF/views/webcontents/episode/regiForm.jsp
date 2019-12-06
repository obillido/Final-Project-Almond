<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
  
  <div class="container">

    <h1 class="mt-4 mb-3">Webcontents
      <small>회차등록</small>
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

        <form method="post" action="${pageContext.request.contextPath}/webcontents/regi" enctype="multipart/form-data">
        	<input type="hidden" name="cultype" value="${cultype}"> 
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
