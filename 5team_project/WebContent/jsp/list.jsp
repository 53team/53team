<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<title>게시판</title>
</head>
<link href="/view/mystyle.css" rel="stylesheet" type="text/css">
<body bgcolor="${ bodyback_c}">
	<center>
		<b>글 목록(전체 글 : ${count}) </b>

		<table width="700">
			<tr>
				<td bgcolor="${value_c}" align="right"><a href="writeForm.do">글쓰기</a>
				</td>
			</tr>
		</table>
		<c:if test="${count == 0}">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${count != 0 }">
			<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
				<tr height="30" bgcolor="${value_c }">
					<td align="center" width="50">번 호</td>
					<td align="center" width="50">제 목</td>
					<td align="center" width="50">작성자</td>
					<td align="center" width="50">작성날짜</td>
					<td align="center" width="50">조회수</td>
					<td align="center" width="50">I P</td>

					<c:forEach var="list" items="${list }">
						<tr height="30">
							<td align="center" width="50">
								<c:out value="${number }" />
								<c:set var="number" value="${number - 1 }" />
							</td>
							<td width="250"><c:if test="${list.re_level > 0}"> //답변글이라면,....
								<img src="board/images/level.gif " width="${5 * list.re_level }" height="16" >	
								<img src="board/images/re.gif">
		</c:if> 
		<c:if test="${list.re_level == 0 }">
			<img src="board/images/re.gif" width="${5 * list.re_level }" height="16" >
		</c:if> <!-- 상세보기 페이지 --> 
			<a href="content.do?num=${list.num }&pageNum=${currentPage}">
					${list.subject } </a> 
		<c:if test="${list.readcount >= 3 }">
			<img src="board/images/hot.gif" width="${5 * list.re_level }" height="16">
			<img src="board/images/hot.gif">
		</c:if>
		</td>
		<td align="center" width="100"><a href="mailto:${list.email }"> ${list.writer } </a></td>
		<td align="center" width="150">${list.reg_date }</td>
		<td align="center" width="150">${list.readcount }</td>
		<td align="center" width="150">${list.ip }</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<c:if test="${count > 0 }">
			<c:set var="pageCount"
				value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1 ) }" />
			<c:set var="startPage" value="${1 }" />
			<c:set var="pageBlock" value="${5 }" />

			<fmt:parseNumber var="result" value="${currentPage / pageBlock }"
				integerOnly="true" />
			<c:if test="${currentPage % pageBlock != 0 }">
				<c:set var="startPage" value="${result * pageBlock + 1 }" />
			</c:if>
			<c:if test="${currentPage % pageBlock == 0 }">
				<c:set var="startPage" value="${(result - 1) * pageBlock + 1 }" />
			</c:if>

			<c:set var="endPage" value="${startPage + pageBlock - 1 }" />

			<c:if test="${startPage > 5 }">
				<a href="list.do?pageNum=${startpage - 5 }">[이전]</a>
			</c:if>

		</c:if>

		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<a href="list.do?pageNum=${i }">[${i }]</a>
		</c:forEach>

		<c:if test="${endPage < pageCount }">
			<a href="list.do?pageNum=${startPage + 5 }">[다음]</a>
		</c:if>
	</center>
</body>

</html>
