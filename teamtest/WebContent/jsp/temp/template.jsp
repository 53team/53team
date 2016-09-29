<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Study53</title>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/insert.js"></script>
<script src="js/reply.js"></script>
<script src="js/search.js"></script>
<script src="js/delete.js"></script>
<script src="js/register.js"></script>
</head>
<body>
<div align=center>
<jsp:include page="top.jsp" />
<br><br><br>
<jsp:include page="${CONTENT}"/>
<br><br><br>
<jsp:include page="bottom.jsp"/>
</div>
</body>
</html>