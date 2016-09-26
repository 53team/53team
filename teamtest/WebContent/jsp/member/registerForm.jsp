<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입창</title>
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
$(document).ready(function(){
	$('#pwd').keyup(function(){
		$('#check').text('');
	});
	$('#repwd').keyup(function(){
		if($('#pwd').val()==$('#repwd').val()){
			$('#check').text('');
		    $('#check').html("암호가 동일합니다");
		} else {
		    $('#check').text('');
		    $('#check').html("암호가 다릅니다. 다시 입력해주세요");
		}
	});
	$('#result').click(function(){
		var i={id:$('#id').val()};
		$.ajax({
			type:"post",
			url:"registerIDCheck.do",
			data:i,
			success:function(data){
				var str = '<p id="result">';
	    		var loc = data.indexOf(str);
	    		var len = str.length;
	    		var result = data.substr(loc+len,1);
	    		if(result=="1"){
	    			alert("중복되는 아이디입니다");
	    	    	$("#id").val("");
	    	     }else if (result=="0")
	    	  	    alert("사용할 수 있는 아이디입니다");
			}
		});
	});
});
</script>
</head>
<body>
<div>
	<form action="registerPro.do" method="post">
		<label for="id">ID</label>
		<input type="text" id="id" name="id" placeholder="최대 12자 영문/숫자" maxlength="12" autofocus required>
		<input type="button" id="result" value="ID중복확인"><br>
		<label for="pwd">비밀번호</label>
		<input type="password" id="pwd" name="pwd" placeholder="최대 12자 영문/숫자" maxlength="12" required><br>
		<label for="repwd">비밀번호 확인</label>
		<input type="password" id="repwd" name="repwd" placeholder="비밀번호 확인" maxlength="12" required>
		<font id="check" color="red"></font><br>
		<label for="name">이름</label>
		<input type="text" id="name" name="name" required><br>
		<label for="phone">전화번호</label>
		<input type="tel" id="phone" name="phone" placeholder="010-0000-0000" required><br>
		<label for="location">지역</label>
		<input type="text" id="location" name="location" placeholder="서울" required><br>
		<input type="submit" value="가입하기">
		<input type="reset" value="다시쓰기">
	</form>
</div>
</body>
</html>