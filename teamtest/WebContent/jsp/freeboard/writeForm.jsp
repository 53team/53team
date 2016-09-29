<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function writeSave(){
	if(!document.writeform.subject.value){
	  alert("제목을 입력하십시요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(!document.writeform.content.value){
	  alert("내용을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	}
 }  
</script>
<title>freeboard/writeForm</title>
</head>
<body>
<div align="center">
<form action = "writePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="${num}">
	<c:if test="${sid == 'admin' }">
	<input type="hidden" name="writer" value="${'관리자'}">
	</c:if>
	<c:if test="${sid != 'admin' }">
	<input type="hidden" name="writer" value="${sid }">
	</c:if>
	<table width="400" border="1" cellspacing="0'" cellpadding="0" align="center">
		<tr>
		   <td align = "right" colspan="2">
		   <a href = "list.do"> 글목록 보기</a>
		</td>
		</tr>
		<tr>
		   <td width="70" align = "center"> 제  목</td>
		   <td width="330"><input type="text" size= "10" maxlength="10" name="subject"></td>
		</tr>
		<tr>
		   <td width="70" align = "center"> 내  용</td>
		   <td width="330"><textarea rows="13" cols="40" name="content"  style="resize:none;"></textarea></td>
		</tr>
		<tr>
		   <td align="center" colspan="2">
		   <input type = "submit" value = "글쓰기">
		   <input type= "reset" value = "다시작성">
		   <input type = "button" value = "목록보기" onclick="window.location='list.do'">
		</tr>
	</table>
</form>
</div>
</body>
</html>