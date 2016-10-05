<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>freeboard/deleteForm</title>
</head>
<body>
<br>
	<div align=center id="smallbox">
	<br>
		<form action="deletePro.do?pageNum=${ pageNum }" method="post" name="delForm">
			<input type="hidden" name="num" value="${ num }">
			<font size="5">정말 게시글을 삭제하시겠습니까 ?</font><br><br>
			<input type="submit" value="예" class="button alt2">
            <a href="javascript:history.go(-1)">
            	<input type="button" value="아니오" onclick="document.location.href='list.do?pageNum=${ pageNum }'" class="button alt2">
			</a>
		</form> 
	<br>
	</div>
</body>
</html>


