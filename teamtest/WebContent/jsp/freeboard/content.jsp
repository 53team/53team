<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>게시판</title>
</head> 
<body>
<div align="center">
	<table width = "50%" border = "1" cellspacing = "2" cellpadding = "0" align="center">
		<tr height="30">
			<td align="center" width = "125">글번호</td>
			<td align="center" width = "125">${num}</td> 	
			<td align="center" width = "125">조회수</td>
			<td align="center" width = "125">${readnum }</td>
		</tr>
		<tr height="30">
			<td align="center" width = "125">작성자</td>
			<td align="center" width = "125">${writer }</td>
			<td align="center" width = "125">작성일</td>
			<td align="center" width = "125">${reg_date }</td>
		</tr>
		<tr height="30">
			<td align="center" width = "125">글제목</td>
			<td align="center" width = "125">${subject }</td>
			<td align="center" width = "125" colspan="2 "></td>
		</tr>
		<tr>
			<td align="center" width = "500" colspan="4" style="word-wrap:break-word"><pre>${content }</pre></td>
		</tr>
		<tr height ="30">
			<td colspan="4" align="right">
			<c:if test="${sid == writer || sid == 'admin'}">
			<input type="button" value="글수정" onclick="document.location.href='updateForm.do?num=${num}&pageNum=${pageNum}'"> 
			<input type="button" value="글삭제" onclick="document.location.href='deleteForm.do?num=${num}&pageNum=${pageNum}'">
			</c:if>
			<input type = "button" value="목록 보기" onclick="document.location.href='list.do?pageNum=${pageNum}'"> 
			</td>
		</tr>
	</table>
</div>
</body>
</html>