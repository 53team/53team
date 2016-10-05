<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<body>
<section id="banner">
	<div class="inner">
		<font size="5" color="white">
		댓글삭제완료!<br>
		5초 후 전 페이지로 돌아갑니다.<br>
		</font>
		<a href="content.do?num=${num}">전 페이지로...</a><br>
		<a href="list.do">글 목록으로...</a>
	</div>
</section>
<script type="text/javascript">
	setTimeout("location.href='content.do?num=${num}'", 5000)
</script>
</body>
</head>
</html>

