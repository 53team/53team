<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>th125 JSP Template</title>
</head>
<body>
<div align="center">
      <b>스터디그룹 목록(전체 스터디그룹 수 : ${count})</b>
      <table width="700">
         <tr>
            <td align="right"><a href="groupForm.do">방만들기</a></td>
         </tr>
         </table>
      <c:if test="${count == 0 }">
         <table width="700" border="1" cellpadding="0" cellspacing="0">
         <tr>
            <td align="center">그룹이 없습니다.</td>
         </tr>
      </table>
      </c:if>
      <c:if test="${count > 0 }">
      <form action="room.do" method="post">
      <table width="750" border="1" cellpadding="0" cellspacing="0" align="center">
         <tr height="30" bgcolor="${value_c}">
            <td align="center" width="50">글 번 호</td>
            <td align="center" width="50">지   역</td>
            <td align="center" width="50">아이디 </td>
            <td align="center" width="50">제   목</td>
            <td align="center" width="50">제한인원</td>
            <td align="center" width="50">작성날짜</td>
            <td align="center" width="50">카테고리</td>
         </tr>
         <c:forEach var="list" items="${ list }">
         <tr height="30" >
         <td align="center" width="50">
            ${ list.num }
         </td>
         <td align="center" width="50">
            <c:out value="${list.location }"/>
         </td>
         <td align="center"  width="50">${ list.id }</td>
         <td align="center"  width="100">
         <a href="room.do?num=${ list.num }&pageNum=${currentPage }">${ list.title }</a>
         </td>
         <td align="center"  width="50">${ list.limit }</td>
         <td align="center"  width="150">${ list.reg_date }</td>
         <td align="center"  width="150">${ list.category }</td>
         </tr>
         </c:forEach>
      </table>
      </form>
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
         <a href="roomlist.do?pageNum=${startPage-5 }">[이전]</a>
      </c:if>
      <c:forEach var="i" begin="${startPage }" end="${endPage }">
         <a href="roomlist.do?pageNum=${i }">[${i }]</a>
      </c:forEach>
      <c:if test="${endPage < pageCount }">
         <a href="roomlist.do?pageNum=${startPage+5 }">[다음]</a>
      </c:if>
      </c:if>
   </div>
</body>
</html>