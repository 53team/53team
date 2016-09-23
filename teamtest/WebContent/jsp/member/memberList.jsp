<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>게시판</title>
</head>
<body>
	<div align="center">
		<b>회원 목록(회원 수 : ${count})</b>
		<c:if test="${count == 0 }">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">회원이 없습니다.</td>
			</tr>
		</table>
		</c:if>
		<c:if test="${count > 0 }">
		<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
			<tr height="30">
				<td align="center" width="50">번호</td>
				<td align="center" width="50">아이디</td>
				<td align="center" width="50">비밀번호</td>
				<td align="center" width="50">이름</td>
				<td align="center" width="50">핸드폰번호</td>
				<td align="center" width="50">지역</td>
				<td align ="center" width = "50">가입날짜</td>
			</tr>
			<c:forEach var="list" items="${list }">
			<tr height="30" >
				<td align="center" width="50">
					<c:out value="${number }"/>
					<c:set var="number" value="${number - 1 }"/>
				</td>
				<td align="center"  width="50">
					<a> ${ list.id } </a>
				</td>
				<td align="center"  width="50">
					<a> ${ list.pwd } </a>
				</td>
				<td align="center"  width="50">
					<a> ${ list.name } </a>
				</td>
				<td align="center"  width="50">
					<a> ${ list.phone } </a>
				</td>
				<td align="center"  width="50">
					<a> ${ list.location } </a>
				</td>
				<td align="center"  width="50">
						${ list.reg_date }
				</td>	
			</tr>
			</c:forEach>
		</table>
		</c:if>
		<c:if test="${count > 0 }">
		<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1 )}"/>
		<c:set var="startPage" value="${1}"/>
		<c:set var="pageBlock" value="${5}"/>
		<fmt:parseNumber var="result" value="${currentPage / pageBlock }" integerOnly="true"/>
		<c:if test="${(currentPage % pageBlock) != 0 }">
			<c:set var="startPage" value="${result * pageBlock + 1 }"/>
		</c:if>
		<c:if test="${(currentPage % pageBlock) == 0 }">
			<c:set var="startPage" value="${(result - 1) * pageBlock + 1}"/>
		</c:if>
		<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
		<c:if test="${startPage > 5 }">
			<a href="memberList.do?pageNum=${startPage-5 }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="memberList.do?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<a href="memberList.do?pageNum=${startPage+5 }">[다음]</a>
		</c:if>
		</c:if>
	</div>
</body>
</html>
