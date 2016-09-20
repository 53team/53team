<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<table width="700" border="1" cellpading="2" cellspacint="0">
		<tr>
			<td colspan="2">
				<jsp:include page="top.jsp" />
			</td>
		</tr>
		
		<tr>
			<td width="150" valign="top" height="400">
				<jsp:include page="mid.jsp" />
			</td>
			<td width="550" valign="top">
				<jsp:include page="${CONTENT }" />
			</td>
		</tr>
		
		<tr>
			<td width="550" valign="top" colspan="1">
				<jsp:include page="bottom.jsp" />
			</td>
		</tr>
	</table>
</center>
</body>
</html>