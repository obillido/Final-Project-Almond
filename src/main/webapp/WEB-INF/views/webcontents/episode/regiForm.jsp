<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
  
  <div class="container">

    <h1 class="mt-4 mb-3">회차등록</h1>

    <ol class="breadcrumb">
     <li class="breadcrumb-item">${contInfo.title}</li>
     <li class="breadcrumb-item">${epnum}회 등록</li>
    </ol>

    <div class="row">
      <div class="col-lg-8 mb-4">

        <form method="post" action="${pageContext.request.contextPath}/webcontents/episode/regi" enctype="multipart/form-data">
        	<input type="hidden" name="contnum" value="${contnum}"> 
          <div class="control-group form-group">
            <div class="controls">
              <label>내용 :</label>
              <textarea rows="10" cols="100" maxlength="999" style="resize:none" name="content"></textarea>
            </div>
          </div>
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
