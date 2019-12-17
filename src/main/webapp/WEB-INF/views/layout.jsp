<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<style style="text/css">
    body {margin:0;}
   
    .wrapper {
     min-height: calc(100vh - 20px);
    }

    footer{height: 20px;}
</style>

<title>layout.jsp</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/jqBootstrapValidation.js"/>"></script>
<script src="<c:url value="/resources/js/contact_me.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>


</head>
<body>
<div id="wrap" class="wrapper">
   <div id="header" style="margin-bottom:45px;">
      <tiles:insertAttribute name="header"/>
   </div>
   <div id="content" style="margin-top:45px;">
      <tiles:insertAttribute name="content"/>
   </div>
</div>
<footer class="footer">
   <tiles:insertAttribute name="footer"/>
</footer>

</body>
</html>