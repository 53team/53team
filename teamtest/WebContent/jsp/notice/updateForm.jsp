<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice/updateForm</title>
</head>
<body>
   <form action="updatePro(notice).do?pageNum=${pageNum}" method="post" name="updateForm" onsubmit="return writeSave()">
      <table width='400' border='1' cellspacing='0' cellpadding='0' align="center">
         <input type="hidden" name="writer" value="${writer}">
         <input type="hidden" name="num" value="${num}">
         <tr>
            <td width="70" align="center">제 목</td>
            <td width="330">
            <input type="text" size="40" maxlength="50" name="subject" value="${subject}">
            </td>
         </tr>
         <tr>
            <td width="70" align="center">내 용</td>
            <td width="330"><textarea rows="13" cols="40" name="content">${content}</textarea></td>
         </tr>
         <tr>
            <td align="center" colspan="2">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="document.location.href='list(notice).do?pageNum=1'">
            </td>
         </tr>
      </table>
   </form>
</body>
</html>