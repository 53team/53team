<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="id" value="${sid}" />
<c:if test="${id != null }">
<div>
	<div align="center">
		<h3>내가 만든 스터디</h3>
		<table border="1">
			 <tr height="30">
            	<td align="center" width="50">글 번 호</td>
            	<td align="center" width="50">지   역</td>
           		<td align="center" width="50">아이디 </td>
            	<td align="center" width="50">제   목</td>
            	<td align="center" width="50">제한인원</td>
            	<td align="center" width="50">작성날짜</td>
            	<td align="center" width="50">카테고리</td>
         	</tr>
         	<c:forEach var="list" items="${ list }" varStatus="idx">
         	<tr height="30">
         		<td align="center" width="50">${ list.num }</td>
         		<td align="center" width="50"><c:out value="${list.location }"/></td>
         		<td align="center" width="50">${ list.id }</td>
         		<td>
         		<a href="room.do?num=${ list.num }">${ list.title }</a>
         		</td>
         		<td align="center" width="50">${cList1[idx.index]} / ${ list.limit }</td>
         		<td align="center" width="50">${ list.reg_date }</td>
         		<td align="center" width="50">${ list.category }</td>
         	</tr>
         	</c:forEach>
		</table>
	</div>
	<div align="center">
		<h3>내가 가입한 스터디</h3>
		<table border="1">
		<tr height="30">
            	<td align="center" width="50">글 번 호</td>
            	<td align="center" width="50">지   역</td>
           		<td align="center" width="50">아이디 </td>
            	<td align="center" width="50">제   목</td>
            	<td align="center" width="50">제한인원</td>
            	<td align="center" width="50">작성날짜</td>
            	<td align="center" width="50">카테고리</td>
        </tr>
        <c:forEach var="list2" items="${list2 }" varStatus="idx2">
        <tr height="30">
         		<td align="center" width="50">${ list2.num }</td>
         		<td align="center" width="50">${ list2.location }</td>
         		<td align="center" width="50">${ list2.id }</td>
         		<td>
         		<a href="room.do?num=${ list2.num }">${ list2.title }</a>
         		</td>
         		<td align="center" width="50">${cList2[idx2.index]} / ${ list2.limit }</td>
         		<td align="center" width="50">${ list2.reg_date }</td>
         		<td align="center" width="50">${ list2.category }</td>
        </tr>
        </c:forEach>
        </table>
	</div>
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