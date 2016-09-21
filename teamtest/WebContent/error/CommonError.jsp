<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page isErrorPage="true" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	에러가 발생했습니다 ......페이지 이동합니다
	<p>
		에러타입 : <%= exception.getClass().getName() %>
		<br>
		에러메시지 : <%= exception.getMessage() %>
	
	</p>
</body>
</html>