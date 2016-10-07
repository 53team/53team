<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a {
		color: black;
		text-decoration: none;
	}
	
 	a:hover { 
 		color: gray; 
 		text-decoration: none;
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
		<font size="5"><b>내가 만든 스터디</b></font>
		<hr>
	</div>
	<div align="center">
		<c:forEach var="list" items="${ list }" varStatus="idx">
		<!-- 마감안된것 -->
		<c:if test="${list.limit > cList1[idx.index] }">
			<a href="room.do?num=${ list.num }">
				<div class="offer">
					<div class="offer-content" align="left">
						<table width=400px>
							<tr>
								<td width=85%></td>
								<td width=15% align="right"><font size="2">${list.location }</font></td>
							</tr>
							<tr>
								<td><font size="5">${ list.title }</font>(${ list.category })</td>
								<td align="right"><font size="2">${cList1[idx.index]} / ${ list.limit }</font></td>
							</tr>
							<tr>
								<td></td>						
								<td align="right"><font size="2">${ list.id }</font></td>
							</tr>
						</table>
					</div>
				</div>
			</a>
		</c:if>
		<!-- 마감된것 -->
		<c:if test="${list.limit == cList1[idx.index] }">
			<a href="room.do?num=${ list.num }">
				<div class="offer">
					<div class="shape">
						<div class="shape-text">
							마감						
						</div>
					</div>
					<div class="offer-content" align="left">
						<table width=400px>
							<tr>
								<td width=85%></td>
								<td width=15% align="right"><font size="2">${list.location }</font></td>
							</tr>
							<tr>
								<td><font size="5">${ list.title }</font>(${ list.category })</td>
								<td align="right"><font size="2">${cList1[idx.index]} / ${ list.limit }</font></td>
							</tr>
							<tr>
								<td></td>							
								<td align="right"><font size="2">${ list.id }</font></td>
							</tr>
						</table>
					</div>
				</div>
			</a>
        </c:if>
        </c:forEach>
	</div>
	<br><br><br>
	<div align="left">
		<font size="5"><b>내가 가입한 스터디</b></font>
		<hr>
	</div>
	<div align="center">
        <c:forEach var="list2" items="${list2 }" varStatus="idx2">
		<!-- 마감안된것 -->
		<c:if test="${list2.limit > cList2[idx2.index] }">
			<a href="room.do?num=${ list2.num }">
				<div class="offer">
					<div class="offer-content" align="left">
						<table width=400px>
							<tr>
								<td width=85%></td>
								<td width=15% align="right"><font size="2">${list2.location }</font></td>
							</tr>
							<tr>
								<td><font size="5">${ list2.title }</font>(${ list2.category })</td>
								<td align="right"><font size="2">${cList2[idx2.index]} / ${ list2.limit }</font></td>
							</tr>
							<tr>
								<td></td>						
								<td align="right"><font size="2">${ list2.id }</font></td>
							</tr>
						</table>
					</div>
				</div>
			</a>
		</c:if>
		<!-- 마감된것 -->
		<c:if test="${list2.limit == cList2[idx2.index] }">
			<a href="room.do?num=${ list2.num }">
				<div class="offer">
					<div class="shape">
						<div class="shape-text">
							마감						
						</div>
					</div>
					<div class="offer-content" align="left">
						<table width=400px>
							<tr>
								<td width=85%></td>
								<td width=15% align="right"><font size="2">${list2.location }</font></td>
							</tr>
							<tr>
								<td><font size="5">${ list2.title }</font>(${ list2.category })</td>
								<td align="right"><font size="2">${cList2[idx2.index]} / ${ list2.limit }</font></td>
							</tr>
							<tr>
								<td></td>						
								<td align="right"><font size="2">${ list2.id }</font></td>
							</tr>
						</table>
					</div>
				</div>
			</a>
        </c:if>
        </c:forEach>
	</div>
	<div id="buttonright">
		<a href="roomList.do"><button class="btn btn-default btn-sm"  type = "button">목록</button></a><br>
	</div>
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