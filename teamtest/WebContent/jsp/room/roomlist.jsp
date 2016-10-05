<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>th125 JSP Template</title>
<style type="text/css">
	a {
		color: black;
		text-decoration: none;
	}
	
 	a:hover { 
 		color: gray; 
 		text-decoration: none;
 	}
 	
 	#buttonright {
	 	text-align: right;
	 	padding-right: 10px;
 	}
</style>
</head>
<body>
<c:set var="id" value="${sid}" />
<c:if test="${id != null }">
<br>
<div class="container" id="middlebox">
<br>
	<div align="left">
		<font size="5"><b>공부방</b></font>
		<hr>
	</div>
	<div align = "right" ><span class="fa fa-bar-chart-o aria-hidden=true"></span> ${count}</div>
	<c:if test="${count == 0 }">
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">그룹이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${id != null }">
	<div class="row">
		<c:forEach var="list" items="${ list }" varStatus="idx">
		<!-- 마감안된것 -->
		<c:if test="${list.limit > list2[idx.index] }">
			<a href="room.do?num=${ list.num }&pageNum=${currentPage }&limit=${list.limit}&location=${list.location}&reg_date=${limit.reg_date}&category=${list.category}&title=${list.title}">
				<div class="offer">
					<div class="offer-content" align="left">
						<table>
							<tr>
								<td></td>
								<td width="260px"></td>
								<td align="right"><font size="2">${list.location }</font></td>
							</tr>
							<tr>
								<td><font size="5">${ list.title }</font>(${ list.category })</td>
								<td></td>
								<td align="right"><font size="2">${list2[idx.index]} / ${ list.limit }</font></td>
							</tr>
							<tr>
								<td></td>
								<td></td>							
								<td align="right"><font size="2">${ list.id }</font></td>
							</tr>
						</table>
					</div>
				</div>
			</a>
		</c:if>
		

		
		<!-- 마감된것 -->
		<c:if test="${list.limit == list2[idx.index] }">
			<a href="roomFull.do?limit=${list.limit }&count=${list2[idx.index]}">
				<div class="offer">
					<div class="shape">
						<div class="shape-text">
							마감						
						</div>
					</div>
					<div class="offer-content" align="left">
						<table>
							<tr>
								<td></td>
								<td width="260px"></td>
								<td align="right"><font size="2">${list.location }</font></td>
							</tr>
							<tr>
								<td><font size="5">${ list.title }</font>(${ list.category })</td>
								<td></td>
								<td align="right"><font size="2">${list2[idx.index]} / ${ list.limit }</font></td>
							</tr>
							<tr>
								<td></td>
								<td></td>							
								<td align="right"><font size="2">${ list.id }</font></td>
							</tr>
						</table>
					</div>
				</div>
			</a>
        </c:if>
		</c:forEach>
		<div id="buttonright">
		<a href="groupForm.do"><button class="btn btn-default btn-sm"  type = "button">방개설</button></a><br>
		</div>
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
				<a href="roomList.do?pageNum=${startPage-5 }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="roomList.do?pageNum=${i }">[${i }]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount }">
				<a href="roomList.do?pageNum=${startPage+5 }">[다음]</a>
			</c:if>
		</c:if>
	</div>	
	</c:if>
<br>
</div>
<br>
</c:if>
<c:if test="${id == null }">
	<script>
		alert("로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다");
	</script>
	<meta http-equiv="Refresh" content="0; url=loginForm.do">
</c:if>
</body>
</html>