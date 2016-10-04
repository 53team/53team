<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>temp/top</title>
</head>
<body>
<header id="header">
	<a href="main.do" class="logo">
	STUDY
	<strong>53</strong></a>
	<nav>
		<a href="#menu">Menu</a>
	</nav>
	<nav id="menu">
		<ul class="links">
			<li><a href="main.do">Home</a></li>
			<c:if test="${sid == null}">
			<li><a href="/teamtest/loginForm.do">Login</a></li> 
			<li><a href="/teamtest/registerForm.do">Join</a></li>
			</c:if>
			<c:if test="${sid != null}"> 
			<li><a href="/teamtest/logout.do">Logout</a></li>
		    <li><a href="/teamtest/modifyCheckForm.do">Modify</a></li>
		    <li><a href="/teamtest/withdrawalForm.do">Withdrawal</a></li>
			</c:if>
			<li><a href="list(notice).do">Notice</a></li>
			<li><a href="list.do">FreeBoard</a></li>
			<li><a href="roomList.do">StudyRoom</a></li>
			<li><a href="hotList.do">Chart</a></li>
			<c:if test="${sid == 'admin'}">
			<li><a href="memberList.do">MemberList</a></li>
			</c:if>
		</ul>
	</nav>
</header>
</body>
</html>