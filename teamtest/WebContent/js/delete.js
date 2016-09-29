$(document).ready(function() {
   $("#checkAll").click(function(e) {
      var table = $(e.target).closest('table');
      $('td input:checkbox', table).prop("checked", this.checked);
   });
});

function checkDel(){ 
	var Check_Count = 0; 
	var frm = document.forms[0];
	
	if(frm.check.length > 0){
	    for(i = 0; i < frm.check.length; ++i) { 
        	if(frm.check[i].checked == true) Check_Count ++;
    	}
	} else { 
		if(frm.check.checked == true) Check_Count ++;
	}

	if(Check_Count == 0) {
        alert("선택항목이 없습니다."); 
		return false;
	}
}