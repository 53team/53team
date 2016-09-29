function check(){
	if(document.reply.re_content.value==""){
		alert("내용을 입력하세요");
		document.reply.re_content.focus();
		return false;
	}
	return true;
}