<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>freeboard/replyDeleteForm</title>
</head>
<body>
   <div align=center>
      <form action="replyDeletePro.do?reply_num=${reply_num }" method="post" name="delForm">
         <input type="hidden" name="re_num" value="${ re_num }">
         	<h2>정말 댓글을 삭제하시겠습니까 ?</h2>
            <input type="submit" value="예" onclick="document.location.href='content.do?num=${num}'">
            <a href="javascript:history.go(-1)">
            <input type="button" value="아니오" onclick="document.location.href='content.do?num=${num}'">
			</a>
      </form>   
   </div>
</body>
</html>


