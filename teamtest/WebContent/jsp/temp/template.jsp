<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Study</title>
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