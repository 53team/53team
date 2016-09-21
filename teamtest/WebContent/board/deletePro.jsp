<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ check == 1 }">
   <script type="text/javascript">
      alert("삭제 완료!");
   </script>
   <meta http-equiv="Refresh" content="0; url=list.do">
</c:if>

<c:if test="${ check == 0 }">
   <script type="text/javascript">
      alert("글 작성자가 다릅니다.");
      history.go(-1);
   </script>
</c:if>