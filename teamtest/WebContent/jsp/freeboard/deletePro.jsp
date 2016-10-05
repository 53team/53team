<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<body>
<section id="banner">
	<div class="inner">
		<font size="5" color="white">
		게시글삭제완료!<br>
		5초 후 글 목록으로 돌아갑니다.<br>
		</font>
		<a href="list.do">글 목록으로...</a>
	</div>
</section>
<script type="text/javascript">
	setTimeout("location.href='list.do'", 5000)
</script>
</body>
</head>
</html>