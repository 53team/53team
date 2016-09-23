<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글목록</title>
<script type="text/javascript">
	function searchMessage(){
		if(document.search.keyWord.value==""){
			alert("검색어를 입력하세요");
			document.search.keyWord.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<c:if test="${vo.count == 0}">
<table width="70%" border="1" cellpadding="0" cellspacing="0" align="center">
<tr>
    <td align="center">
    	앨범에 저장된 글이 없습니다.
    </td>
</table>
</c:if>
<h1 align="center">자유게시판</h1>
<c:if test="${vo.count > 0}">
	<table width="70%" cellpadding="0" cellspacing="0" align="center">
		<tr>
		    <td width="70">번호</td>   
		    <td>글제목</td>
		    <td width="120">작성자</td>
		    <td width="70">조회수</td>
		    <td width="120">작성일 </td>
		</tr>
		<c:set var="number" value="${vo.number}"/>
		<c:forEach var="list" items="${list}">
		<tr> 
		    <td>${number}<c:set var="number" value="${number - 1}"/></td>
		    <td><a href="content.do?num=${list.num}">${list.subject}</a></td>
		    <td>${list.writer}</td>
		    <td>${list.readnum}</td>
		    <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd."/></td>
		</tr>
		</c:forEach>
	</table>
</c:if>
<form action="list.do" name="search" method="get" onsubmit="return searchMessage()">
<table align="center" cellpadding="4" cellspacing="0">
	<tr>
    	<td align="center" valign="bottom">
      		<select name="keyField">
      			<c:if test="${vo.keyField=='subject'}"><option value="subject" selected="selected">제목</option></c:if>
      			<c:if test="${vo.keyField!='subject'}"><option value="subject">제목</option></c:if>
      			<c:if test="${vo.keyField=='writer'}"><option value="writer" selected="selected">작성자</option></c:if>
      			<c:if test="${vo.keyField!='writer'}"><option value="writer">작성자</option></c:if>
      			<c:if test="${vo.keyField=='content'}"><option value="content" selected="selected">내용</option></c:if>
      			<c:if test="${vo.keyField!='content'}"><option value="content">내용</option></c:if>
			</select>
        <input type="text" size=16 name="keyWord" value="${vo.keyWord}"><input type="submit" value="검색">
        </td>
        <td align="left"><a href="writeForm.do">글쓰기</a></td>
	</tr>
	<tr>
		<td colspan="3" align="center">
		<c:if test="${vo.count > 0}">
			<c:set var="pageCount" value="${(vo.count - 1) / vo.pageSize + 1}"/>
			<c:set var="pageBlock" value="${10}"/>
			<fmt:parseNumber var="rs" value="${(currentPage - 1) / pageBlock}" integerOnly="true" />
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage + pageBlock-1}"/>
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if> 
			<c:if test="${startPage > pageBlock}">
				<a href="list.do?pageNum=${startPage - pageBlock }&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[이전]</a>
			</c:if>
  			<c:forEach var="i" begin="${startPage}" end="${endPage}">
	       		<c:if test="${i == vo.currentPage}">
	          		[${i}]
				</c:if>
				<c:if test="${i != vo.currentPage}">
	            	<a href="list.do?pageNum=${i}&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[${i}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="list.do?pageNum=${startPage + pageBlock}&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[다음]</a>
			</c:if>
		</c:if>
   		</td>
   	</tr>
</table>
</form>
</body>
</html>