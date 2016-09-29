<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>freeboard/content</title> 
<script type="text/javascript">
	function check(){
		if(document.reply.re_content.value==""){
			alert("내용을 입력하세요");
			document.reply.re_content.focus();
			return false;
		}
		return true;
	}
</script> 

</head> 
<body>
<div align="center">
	<table width="50%" border = "1" cellspacing = "2" cellpadding="0" align="center">
		<tr height="30">	
			<td align="center" width = "125">글제목</td>
			<td align="center" width = "125" colspan="5">${subject }</td>

		</tr>
		<tr height="30">
			<td align="center" width = "125">조회수</td>
			<td align="center" width = "125">${readnum }</td>
			<td align="center" width = "125">작성자</td>
			<td align="center" width = "125">${writer }</td>
			<td align="center" width = "125">작성일</td>
			<td align="center" width = "125">${reg_date }</td>
		</tr>
		<tr>
			<td align="center" width = "500" colspan="6" style="word-wrap:break-word"><pre>${content }</pre></td>
		</tr>
		<tr height ="30">
			<td colspan="6" align="right">
				<c:if test="${sid == writer || sid == 'admin'}">
					<input type="button" value="글수정" onclick="document.location.href='updateForm.do?num=${num}'"> 
					<input type="button" value="글삭제" onclick="document.location.href='deleteForm.do?num=${num}'">
				</c:if>
					<input type = "button" value="목록 보기" onclick="document.location.href='list.do?pageNum=1'"> 
			</td>
		</tr>
	</table>
	<br>
	<table width="50%" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td align="right" colspan="4">댓글${count }</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr> 
			<c:if test="${list.re_writer == '관리자' }">
		    <td align="center"><b>${list.re_writer}</b></td>
		    </c:if>
		    <c:if test="${list.re_writer != '관리자' }">
		    <td align="center">${list.re_writer}</td>
		    </c:if>
		    <td align="center">${list.re_content }</td>
			<td align="center">${list.re_reg_date }</td>
			<td align="center">
				<c:if test="${sid == list.re_writer || sid == 'admin'}">
            		<input type="button" value="삭제" onclick="document.location.href='replyDeleteForm.do?re_num=${list.re_num}&reply_num=${list.reply_num}'">
            	</c:if>
         	</td>
		</tr>
		</c:forEach>
	</table>
	<br>
	<c:if test="${sid != null }">
	<form action="replyPro.do" method="post" name="reply" onsubmit="return check()" >
		<input type="hidden" name="re_num" value="${re_num}">
		<c:if test="${sid == 'admin' }">
		<input type="hidden" name="re_writer" value="${'관리자'}">
		</c:if>
		<c:if test="${sid != 'admin' }">
		<input type="hidden" name="re_writer" value="${sid }">
		</c:if>
		<input type="hidden" name="reply_num" value="${reply_num}">
		<table width = "50%" cellspacing = "2" cellpadding="0" align="center">
			<tr>
				<td align="left">
					<input type="text" name="re_content" size="80">
					<input type = "submit" value = "댓글작성" >
				</td>
			</tr>
		</table>
	</form>
	</c:if>
	<c:if test="${sid == null }">
		<table width = "50%" cellspacing = "2" cellpadding="0" align="center">
			<tr>
				<td align="left">
					<input type="text" name="re_content" size="80" disabled="disabled" value="로그인 하셔야 합니다.">
					<input type="submit" value="댓글작성">
				</td>
			</tr>
		</table>
	</c:if>
</div>
</body>
</html>