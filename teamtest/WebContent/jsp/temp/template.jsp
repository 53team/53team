<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Study53</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/main.css">


</head>
<body>
<div align=center>
<jsp:include page="top.jsp" />
<div style="min-height: 100%; background-image: url('/teamtest/css/main.png'); background-size:100% 100%; " >
<jsp:include page="${CONTENT}"/>
</div>
<jsp:include page="bottom.jsp"/>
</div>

<!-- JS -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/skel.min.js"></script>

<script src="js/insert.js"></script>
<script src="js/reply.js"></script>
<script src="js/search.js"></script>
<script src="js/delete.js"></script>
<script src="js/register.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>
</body>
</html>