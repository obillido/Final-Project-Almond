<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    #container {
      margin: 0 auto;  
      padding-top:50px;   
      padding-bottom:50px;
      width:30%;
    }
</style>

<div id="container">

   <span class="badge badge-warning" style="font-size:1.2em"><strong>제목</strong></span><br>
   <input type="text" value="${vo.title }" class="form-control" readonly="readonly"><br>
   <span class="badge badge-warning" style="font-size:1.2em"><strong>내용</strong></span><br>
   <input type="text" value="${vo.content }" class="form-control" readonly="readonly">
<br>
<hr class="my-4">
<br>
<div class="pos-f-t">
  <div class="collapse" id="navbarToggleExternalContent">
    <div class="bg-warning p-4">
      <h5 class="text-white h4">Collapsed content</h5>
      <span class="text-muted">Toggleable via the navbar brand.</span>
    </div>
  </div>
  <nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>   답변 보기 
    </button>
  </nav>
</div>
</div>