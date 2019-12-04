<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
   #category{margin-left:250px;}
   #list{margin-left:290px;}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#btn2").click(function(){
	   $("#list").empty();
       $.ajax({
            url:"${pageContext.request.contextPath}/webtoon/category2",
            dataType:"xml",
            success:function(data){                          
               $(data).find("webtoon").each(function(){
                  var contnum=$(this).find("contnum").text(); 
                  var title=$(this).find("title").text(); 
                  var cultype=$(this).find("cultype").text();
                  var genre=$(this).find("genre").text();
                  var outline=$(this).find("outline").text();
                  var price=$(this).find("price").text();
                  var waiting=$(this).find("waiting").text();
                  var img=$(this).find("img").text();
                  var completiontype=$(this).find("completiontype").text();
                  var agegrade=$(this).find("agegrade").text();
                  var freenum=$(this).find("freenum").text();
                                          
                                 
                  var info="<div class='row'><div class='col-lg-8 col-md-3 col-sm-6 mb-3'><div class='card h-100'>" 
                         + "<a href='#'><img class='card-img-top' src='http://placehold.it/700x400'></a>"
                         + "<div class='card-body'>"
                         + "<h4 class='card-title'><a href='#'>" + title + "</a></h4>"
                         + "<p class='card-text'>" + outline + "</p></div>"                
                         + "</div></div></div>";
                                                              
                  $("#list").append(info);
                                          
               });
            }
       });
   });
});
</script>


<!-- Page Content -->
<div class="container">
  <br><br><br>
  <div id="category">
     <input type="button" value="기다리면 무료" id="btn1" class="btn-primary btn-lg">
     <input type="button" value="웹툰" id="btn2" class="btn-primary btn-lg">
     <input type="button" value="순정" id="btn3" class="btn-primary btn-lg">
     <input type="button" value="소년" id="btn4" class="btn-primary btn-lg">
     <input type="button" value="드라마" id="btn5" class="btn-primary btn-lg">
     <input type="button" value="액션무협" id="btn6" class="btn-primary btn-lg">
  </div>
  <br>
<div id="list"></div>


  <!-- Pagination -->
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">이전</span>
          </a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">다음</span>
          </a>
    </li>
  </ul>
</div>
<!-- /.container -->