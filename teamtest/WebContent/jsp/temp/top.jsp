<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>temp/top</title>
<script>
$(function(){
  $(".menu li").hover(function(){
    $('ul:first',this).show();
  }, function(){
    $('ul:first',this).hide();
  });
});
</script>
</head>
<body>
<div class='menu-bar'>
	<ul class="menu">
		<li><a href="main.do">홈</a>
		<li><a href="#">게시판</a>
	    	<ul>
	      		<li><a href="/teamtest/list(notice).do">공지사항</a></li>
	      		<li><a href="/teamtest/list.do">자유게시판</a></li>
	    	</ul>
		</li>
		<li><a href="#">공부방</a>
			<ul>
				<li><a href="/teamtest/groupForm.do">모집글 작성</a></li>
        		<li><a href="/teamtest/roomlist.do">모집글 검색</a></li>
			</ul>
		</li>
		<li><a href="/teamtest/hotList.do">핫이슈</a></li> 
		<li><a href="#">사이트맵</a></li>
		<c:if test="${sid == null}">
		<li><a href="/teamtest/loginForm.do">로그인</a></li> 
		<li><a href="/teamtest/registerForm.do">회원가입</a></li>
		</c:if>
		<c:if test="${sid != null}"> 
		<li><a href="/teamtest/logout.do">로그아웃</a></li>
		<li><a href="#">내정보관리</a>
			<ul>
			    <li><a href="/teamtest/modifyCheckForm.do">정보수정</a></li>
			    <li><a href="/teamtest/withdrawalForm.do">회원탈퇴</a></li>
			</ul>
		</li>
		</c:if>
		<c:if test="${sid == 'admin'}">
		<li><a href="memberList.do">회원목록</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>