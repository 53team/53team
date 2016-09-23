<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>top</title>
	
<style>

/* 메뉴바를 화면 맨끝에 붙여주는 역할 */
body { 
	margin: 0; 
}

/* 상단메뉴바 초기영역 */
.menu-bar {
position: fixed;
background: gray;
width: 50000000px;
}

/* 메뉴바 영역에서 리스트들을 구석에 붙여줌 */
.menu { 
	margin: 0; 
	padding: 0; 
}

/* 메뉴바 내 리스트들을 가로로 정렬해줌 */
.menu li {
  float: left;
  list-style:none;
  position: relative;
}

/* 마우스 내렸을때 큰메뉴의 배경색 */
.menu li:hover {
	background: white; 
}

/* 마우스 올렸을때 큰메뉴의 배경색 */
.menu li:hover>a {
	color: gray; 
}

/* 메뉴바 내 리스트들을 다음과 같이 정의해줌 */
.menu a {
  color: white;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}

/* 소메뉴 안 영역 */
.menu ul {
  background: white;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 180px;
}

/* 소메뉴 안 영역의 글씨 */
.menu ul a { 
	color: black; 
}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
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
    <li><a href="#">게시판</a>
      <ul>
        <li><a href="#">공지사항</a></li>
        <li><a href="/teamtest/list.do">자유게시판</a></li>
      </ul>
    </li>
    <li><a href="#">공부방</a>
   	  <ul>
   	  	<li><a href="#">모집글</a></li>
        <li><a href="#">모집글 작성</a></li>
        <li><a href="#">모집글 검색</a></li>
      </ul>
    </li>
    <li><a href="#">핫이슈</a></li> 
    <li><a href="#">사이트맵</a></li>
    <c:if test="${sid == null}">
    <li><a href="/teamtest/loginForm.do">로그인</a></li> 
    <li><a href="/teamtest/registerForm.do">회원가입</a></li>
    </c:if>
    <c:if test="${sid != null}"> 
    <li><a href="/teamtest/logout.do">로그아웃</a></li>
    <li><a href="#">내정보관리</a>
      <ul>
        <li><a href="/teamtest/modifyForm.do">정보수정</a></li>
        <li><a href="/teamtest/withdrawalForm.do">회원탈퇴</a></li>
      </ul>
    </li>
    </c:if>
    <c:if test="${sid == 'admin'}">
    <li><a href="memberList.do">회원관리</a></li>
    </c:if>
  </ul>
</div>
</body>
</html>