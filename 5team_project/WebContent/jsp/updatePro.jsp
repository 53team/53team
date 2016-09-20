
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<c:if test="${check == 1 }">
	<meta http-equiv="Refresh"  content="0; url=list.do?pageNum=${pageNum }" >
</c:if>
	

<c:if test="${check != 1 }">
	<script type="text/javascript">
	<!--
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
	//-->
</script>		
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>