<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script language='javascript' src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	<c:set value="${CONTENT }" var="content"/>
	<script>
		$(document).ready(function() {
			jQuery.ajax({
				success:function(msg) {
					$("#myDiv").load("index.html");
				}, error: function(xhr,status,error) {
					alert(error);
				}	
			});
		});
	</script>
</head>
<body>
</body>
</html>