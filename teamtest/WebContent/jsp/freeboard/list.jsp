<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script>
function check() {
    if (document.search.keyWord.value == "") {
        alert("검색어를 입력하세요.");
        document.search.keyWord.focus();
        return;
    }
    document.search.submit();
}
</script>
	<title>게시판</title>
</head>
<body>
	<div align="center">
		<b>자유게시판(전체 글 : ${count})</b>
		<table width="700">
			<tr>
				<td align="right">
				<c:if test="${sid != null }">
				<a href="writeForm.do">글쓰기</a>
				</c:if>
				<c:if test="${sid == null }">
				<a href="loginForm.do">글쓰기</a>
				</c:if>
				</td>
			</tr>
			</table>
		<c:if test="${count == 0 }">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
		</c:if>
		<c:if test="${count > 0 }">
		<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
			<tr height="30">
				<td align="center" width="50">번 호</td>
				<td align="center" width="50">제 목</td>
				<td align="center" width="50">작성자</td>
				<td align="center" width="50">작성날짜</td>
				<td align="center" width="50">조회수</td>
			</tr>
			<c:forEach var="list" items="${list }">
			<tr height="30" >
				<td align="center" width="50">
					<c:out value="${number }"/>
					<c:set var="number" value="${number - 1 }"/>
				</td>
				<td width="250">
					<a href="content.do?num=${list.num }&pageNum=${currentPage }">${list.subject }</a>
					<c:if test="${list.readnum >= 3}">
					 	<img src="/jsp/freeboard/images/hot.gif">
					</c:if>
				</td>
				<td align="center"  width="100">
					${ list.writer }
				</td>
				<td align="center"  width="150">${ list.reg_date }</td>
				<td align="center"  width="150">${ list.readnum }</td>
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
			<a href="list.do?pageNum=${startPage-5 }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="list.do?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<a href="list.do?pageNum=${startPage+5 }">[다음]</a>
		</c:if>
		</c:if>
		<form action="boardList.action" name="search" method="post"> 
			<select name="keyField" size="1">
                <option value="name" <c:if test="${'name'==keyField }"> selected</c:if>> ID </option>
                <option value="title" <c:if test="${'title'==keyField }"> selected</c:if>> 제목 </option>
                <option value="content" <c:if test="${'content'==keyField }"> selected</c:if>> 내용 </option>
            </select>
                 <input type="text" size="16" name="keyWord" value="${keyWord }">
                 <input type="button" value="검색" onClick="check()">
                 <input type="hidden" name="page" value="0"></td>
    
    </form>  
	</div>
</body>
</html>