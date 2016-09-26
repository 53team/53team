<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글목록</title>
<script type="text/javascript">
	function search(){
		if(document.search.keyWord.value==""){
			alert("검색어를 입력하세요");
			document.search.keyWord.focus();
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
	   $("#checkAll").click(function(e) {
	      var table = $(e.target).closest('table');
	      $('td input:checkbox', table).prop("checked", this.checked);
	   });

	});
</script>
<script type="text/javascript">
function checkDel(){ 
	var Check_Count = 0; 
	var frm = document.forms[0];
	
	if(frm.check.length > 0){
	    for(i = 0; i < frm.check.length; ++i) { 
        	if(frm.check[i].checked == true) Check_Count ++;
    	}
	} else { 
		if(frm.check.checked == true) Check_Count ++;
	}

	if(Check_Count == 0) {
		alert("선택항목이 없습니다."); 
	return false; 
	}
}
</script>
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
<c:if test="${vo.count > 0}">
	<form action="/teamtest/freeboardTest.do" name="checkbox" onsubmit="return checkDel()">
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
		    <td align="center"><a href="content.do?num=${list.num}">${list.subject}</a></td>
		    <td align="center">${list.writer}</td>
		    <td align="center">${list.reg_date }</td>
		    <td align="center">${list.readnum}</td>
		</tr>
		</c:forEach>
		<c:if test="${sid == 'admin' }">
		<tr>
			<td colspan = "9" align = "right">
			<input type = "submit" value = "삭제">
			</td>	
		</tr>
		</c:if>
	</table>
	</form>
</c:if>
	
<form action="list.do" name="search" method="get" onsubmit="return search()">
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
<c:if test="${sid != null }">
<a href="writeForm.do">글쓰기</a>
</c:if>
<c:if test="${sid == null }">
<a href="loginForm.do">글쓰기</a>
</c:if>
</body>
</html>