<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1>댓글</h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Blog Home 2</li>
    </ol>

    <div class="row">

      <div class="col-lg-8">

        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">독자님! 한마디 남겨주세요.</h5>
          <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/webcontents/comments/regi">
              <input type="hidden" name="epinum" value="${epinum}">
              <div class="form-group">
                <textarea class="form-control" rows="3" name="content"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">등록</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
						댓글내용
          </div>
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
						댓글내용
		
            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
								댓글내용
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
              	댓글내용
              </div>
            </div>

          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>