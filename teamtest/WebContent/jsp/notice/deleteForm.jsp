<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="../view/style.css" rel="stylesheet" type="text/css">
</head>
<body>
   <div align=center>
      <form action="deletePro(notice).do?pageNum=${ pageNum }" method="post" name="delForm">
         <input type="hidden" name="num" value="${ num }">
         	<h2>정말 삭제하시겠습니까 ?</h2>
            <input type="submit" value="예">
            <a href="javascript:history.go(-1)">
            <input type="button" value="아니오" onclick="document.location.href='list(notice).do?pageNum=${ pageNum }'">
			</a>
      </form>   
   </div>
</body>
</html>


