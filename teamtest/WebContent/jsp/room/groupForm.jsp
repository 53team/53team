<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>모집글 올리기</title>
</head>
	<body>
		<c:set var="id" value="${sid}" />
		<c:if test="${id != null }">
			<h1><b>S T U D Y   G R O U P</b></h1><br><br><br><br><br><br>
			<div align="center" style="border:1px solid #ceceb7">
			<form action="groupPro.do" method="post">
			<input type="hidden" name="id" value="${sid}">
			<label for="title">Title</label>
			<input type="text" id="title" name="title" placeholder="Title" maxlength="12" required><br>
			<label for="limit">Limit</label>
			<input type="number" id="limit" name="limit" placeholder="참여인원" required><br>
			<label for="location">Location</label>
			<select name="location">
				<option>서울</option>
				<option>경기</option>
				<option>충청</option>
				<option>강원</option>
				<option>경상</option>
				<option>전라</option>
				<option>제주</option>
			</select>
			<label for="category">Category</label>
			<select  name="category">
			  <option value="JAVA">JAVA</option>
			  <option value="C">C</option>
			  <option value="C++">C++</option>
			  <option value="C#">C#</option>
			  <option value="PYTHON">PYTHON</option>
			</select><br>
			<label for="content">Content</label><br>
			<textarea rows="13" cols="40" id="content" name="content" placeholder="스터디에 대한 간단한 설명" required></textarea><br>
			<input type="submit" value="STUDY등록하기">	
			</form>
			</div>
		</c:if>
		<c:if test="${id == null }">
			<script>
				alert("로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다");
			</script>
			<meta http-equiv="Refresh" content="0; url=loginForm.do">
		</c:if>
	</body>
</html>