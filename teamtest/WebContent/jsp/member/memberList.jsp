<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
	<title>게시판</title>
</head>
<body>
<h1 align="center">회원목록</h1>
<h5>총 ${vo.count - 1}명</h5>
<c:if test="${vo.count == 1 }">
	<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr>
		    <td align="center">회원이 없습니다.</td>
		</tr>
	</table>
</c:if>
<c:if test="${vo.count > 1 }">
	<form action = "/teamtest/memberTest.do" onsubmit="return checkDel()">
	<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr height="30">
			<td align="center"><input type="checkbox" id="checkAll" /></td>
			<td align="center">번호</td>
			<td align="center">아이디</td>
			<td align="center">이름</td>
			<td align="center">핸드폰번호</td>
			<td align="center">가입날짜</td>
			<td align="center">지역</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
			<td align = "center">
				<input type="checkbox"  name="check" value="${list.id}">
			</td>
			<td align="center">
				<c:out value="${vo.number - 1}"/>
				<c:set var="number" value="${vo.number - 1 }"/>
			</td>
			<td align="center">
				${ list.id }
			</td>
			<td align="center">
				${ list.name }
			</td>
			<td align="center">
				${ list.phone }
			</td>
			<td align="center">
				${ list.reg_date }
			</td>
			<td align="center">
				${ list.location }
			</td>		
		</tr>
		</c:forEach>
		<tr>
			<td colspan = "9" align="right">
			<input type = "submit" value="탈퇴처리">
			</td>	
		</tr>
	</table>
	</form>
</c:if>
	<c:if test="${vo.count > 1 }">
		<c:set var="pageCount" value="${vo.count / vo.pageSize + ( count % pageSize == 0 ? 0 : 1 )}"/>
		<c:set var="startPage" value="${1}"/>
		<c:set var="pageBlock" value="${5}"/>
		<fmt:parseNumber var="result" value="${vo.currentPage / pageBlock }" integerOnly="true"/>
		<c:if test="${(vo.currentPage % pageBlock) != 0 }">
			<c:set var="startPage" value="${result * pageBlock + 1 }"/>
		</c:if>
		<c:if test="${(vo.currentPage % pageBlock) == 0 }">
			<c:set var="startPage" value="${(result - 1) * pageBlock + 1}"/>
		</c:if>
		<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
		<c:if test="${startPage > 5 }">
			<a href="memberList.do?pageNum=${startPage - pageBlock }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="memberList.do?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<a href="memberList.do?pageNum=${startPage+5 }">[다음]</a>
		</c:if>
	</c:if>
</body>
</html>
