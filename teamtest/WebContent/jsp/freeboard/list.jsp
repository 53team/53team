<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>freeboard/list</title>
</head>
<body>
<h1 align="center">자유게시판</h1>
<h5>총 ${vo.count}건</h5>
<c:if test="${vo.count == 0}">
	<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr>
		    <td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
</c:if>
<form action="/teamtest/freeboardTest.do" name="checkbox" onsubmit="return checkDel()">
<c:if test="${vo.count > 0}">
	<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<c:if test="${sid == 'admin' }">
			<td align="center"><input type="checkbox" id="checkAll" /></td>
			</c:if>
		    <td align="center">번호</td>   
		    <td align="center">글제목</td>
		    <td align="center">작성자</td>
		    <td align="center">작성일</td>
		    <td align="center">조회수</td>
		</tr>
		<c:set var="number" value="${vo.number}"/>
		<c:forEach var="list" items="${list}">
		<tr> 
			<c:if test="${sid == 'admin' }">
			<td align = "center" width = "50">
				<input type="checkbox"  name="check" value="${list.num}">
			</td>
			</c:if>
		    <td align="center">${number}<c:set var="number" value="${number - 1}"/></td>
		    <td align="left"><a href="content.do?num=${list.num}">${list.subject}</a></td>
		    <c:if test="${list.writer == '관리자' }">
		    <td align="center"><b>${list.writer}</b></td>
		    </c:if>
		    <c:if test="${list.writer != '관리자' }">
		    <td align="center">${list.writer}</td>
		    </c:if>
		    <td align="center">${list.reg_date }</td>
		    <td align="center">${list.readnum}</td>
		</tr>
		</c:forEach>
	</table>
</c:if>
	<table>
		<tr>
			<td align="right">
				<c:if test="${sid == 'admin' }">
					<input type="submit" value="삭제">
				</c:if>
				<c:if test="${sid != null }">
					<a href="writeForm.do"><input type="button" value="글쓰기"></a>
				</c:if>
				<c:if test="${sid == null }">
					<a href="loginForm.do"><input type="button" value="글쓰기"></a>
				</c:if>
			</td>	
		</tr>
	</table>
</form>	
<form action="list.do" name="search" method="get" onsubmit="return seachCheck()">
<table align="center" cellpadding="4" cellspacing="0">
	<c:if test="${vo.count > 0}">
	<tr>
		<td colspan="3" align="center">
			<c:set var="pageCount" value="${vo.count / vo.pageSize + (count % pageSize == 0 ? 0 : 1)}"/>
			<c:set var="startPage" value="${1}"/>
			<c:set var="pageBlock" value="${5}"/>
			<fmt:parseNumber var="rs" value="${vo.currentPage / pageBlock}" integerOnly="true" />
			<c:if test="${(vo.currentPage % pageBlock) != 0 }">
				<c:set var="startPage" value="${rs * pageBlock + 1 }"/>
			</c:if>
			<c:if test="${(vo.currentPage % pageBlock) == 0 }">
				<c:set var="startPage" value="${(rs - 1) * pageBlock + 1}"/>
			</c:if>
			<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
			<c:if test="${startPage > 5 }">
				<a href="list.do?pageNum=${startPage - pageBlock }&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="list.do?pageNum=${i}&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount }">
				<a href="list.do?pageNum=${startPage + pageBlock}&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[다음]</a>
			</c:if>
   		</td>
   	</tr>
   	</c:if>
   	<tr>
    	<td align="center" valign="bottom">
      		<select name="keyField">
      			<c:if test="${vo.keyField == 'subject'}"><option value="subject" selected="selected">제목</option></c:if>
      			<c:if test="${vo.keyField != 'subject'}"><option value="subject">제목</option></c:if>
      			<c:if test="${vo.keyField == 'writer'}"><option value="writer" selected="selected">작성자</option></c:if>
      			<c:if test="${vo.keyField != 'writer'}"><option value="writer">작성자</option></c:if>
      			<c:if test="${vo.keyField == 'content'}"><option value="content" selected="selected">내용</option></c:if>
      			<c:if test="${vo.keyField != 'content'}"><option value="content">내용</option></c:if>
			</select>
        <input type="text" size=16 name="keyWord" value="${vo.keyWord}"><input type="submit" value="검색">
        </td>
	</tr>
</table>
</form>
</body>
</html>