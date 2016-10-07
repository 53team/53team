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
<br>
<div align="center" id="middlebox2">
	<form action="groupPro.do" method="post">
		<input type="hidden" name="id" value="${sid}">
		<div align="left">
			<font size="5"><b>&nbsp;&nbsp;&nbsp;Create Room</b></font>
			<hr>
		</div>
		<fieldset>
			<div class="form-group">
				<label for="title" class="col-lg-2 control-label">Title</label>
				<div class="col-lg-10">
					<input type="text" id="title" name="title" class="form-control" placeholder="제목" required>
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<label for="limit" class="col-lg-2 control-label">Limit</label>
				<div class="col-lg-2">
					<input type="number" id="limit" name="limit" class="form-control" placeholder="인원" min="2" max="6" required><br>
				</div>
				<label for="location" class="col-lg-2 control-label">Location</label>
				<div class="col-lg-2">
					<select name="location" class="form-control">
						<option>서울</option>
						<option>경기</option>
						<option>충청</option>
						<option>강원</option>
						<option>경상</option>
						<option>전라</option>
						<option>제주</option>
					</select>
				</div>
				<label for="category" class="col-lg-2 control-label">Category</label>
				<div class="col-lg-2">
					<select  name="category" class="form-control">
						<option value="JAVA">JAVA</option>
						<option value="C">C</option>
						<option value="C++">C++</option>
						<option value="C#">C#</option>
						<option value="PYTHON">PYTHON</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<br><br>
				<label for="textArea" class="col-lg-2 control-label">Content</label>
				<div class="col-lg-10">
					<textarea class="form-control" id="content" style="resize:none; height : 300px;" name="content"	 placeholder="스터디 설명" required></textarea>
				</div>
			</div>
		</fieldset>
		<br>
		<input class="btn btn-default btn-sm" type="submit" value="개설">
		<input class="btn btn-default btn-sm" type="button" value="취소" onclick="window.location='roomList.do'">
	</form>
</div>
<br>
</c:if>
<c:if test="${id == null }">
	<script>
		alert("로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다");
	</script>
	<meta http-equiv="Refresh" content="0; url=loginForm.do">
</c:if>
	</body>
</html>