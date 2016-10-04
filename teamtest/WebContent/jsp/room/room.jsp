<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-1.7.1.js"></script>
<script src="https://cdn.socket.io/socket.io-1.4.5.js"></script>
<script>
    //엔터키에 메세지전송 자바스크립트
   function enterClick(){
      if(event.keyCode==13){
         btn.click();
         $('#txt').val('');
      }
   }

    $(document).ready(function(){
       var socket = io.connect('http://192.168.0.35:52273/');
       
          var userid = '${ id }';
          var roomname = '${ num }';
          socket.emit('join', {'userid': userid , 'roomname': roomname});
       
       //접속자 알림
       socket.on('join', function(data){
          alert(data + '로 접속하셨습니다');
          /* $('#txtappend').append('<dd style="margin:0px;">' + data + '님이 접속 하셨습니다.</dd>'); */
       });
       
       //메시지 전송
       $('#btn').click(function(){
          var message = userid + ' : ' + $('#txt').val();
          socket.emit('message', message);
       });
       
       socket.on('message', function(data){
          $('#txtappend').append('<dd style="margin:0px">'+ data + '</dd>');
       });
    });
    
    
    </script>
</head>
<body>
 <!-- 채팅영역 -->
<div id="chat" align="right">
      <div style="width: 300px; height:300px; border:solid 1px; overflow:auto" id="txtarea">
         <dl id="txtappend"></dl>
      </div>
      <br>
      <div>
      <input type="text" style="width:255px;" id="txt" onkeydown="enterClick();">
      <input type="button" name="btn" id="btn" value="Enter">
      </div>
</div>
<!-- 게시판 영역 -->
<div align="center">
   <form action="join.do" method="post">
   <table border = "1" cellspacing = "2" cellpadding = "0" align="Left">
      <tr>
         <td align="center" width = "125">글번호</td>
         <td align="center" width = "125">${ num }</td>    
         <td align="center" width = "125">스터디 인원(명)</td>
         <td align="center" width = "125">${ limit }</td>
      </tr>
      <tr>
         <td align="center" width = "125">작성자</td>
         <td align="center" width = "125">${ id }</td>
         <td align="center" width = "125">작성일</td>
         <td align="center" width = "125">${ reg_date }</td>
      </tr>
      <tr>
         <td align="center" width = "125">스터디지역</td>
         <td align="center" width = "125">${ location }</td>
         <td align="center" width = "125">카테고리</td>
         <td align="center" width = "125">${ category }</td>
      </tr>
      <tr>
         <td align="center" width = "125">글제목</td>
         <td align="center" width = "125" colspan="3">${ title }</td>
      </tr>
      <tr>
         <td align="center" width = "500" colspan="4" style="word-wrap:break-word"><pre>${ content }</pre></td>
      </tr>
      <tr>
         <td colspan="4" align="right">
         <c:if test="${sid == id || sid == 'admin'}">
         <input type="submit" value="스터디 시작">
         <input type="button" value="글삭제" onclick="document.location.href='roomdelete.do'">
         </c:if>
         <input type = "button" value="목록 보기" onclick="document.location.href='roomlist.do'"> 
         </td>
      </tr>
   </table>
   </form>
</div>
</body>
</html>