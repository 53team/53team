function searchCheck(){
	if(document.search.keyWord.value==""){
		alert("검색어를 입력하세요");
		document.search.keyWord.focus();
		return false;
	}
	return true;
}