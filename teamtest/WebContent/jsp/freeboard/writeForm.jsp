<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
hr {
	margin-top: 0px;
}
</style>
<title>freeboard/writeForm</title>
</head>
<body>
<br>
<div align="center" id="middlebox2">
<form action = "writePro.do" method="post" name="writeform" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="${num}">
	<c:if test="${sid == 'admin' }">
		<input type="hidden" name="writer" value="${'관리자'}">
	</c:if>
	<c:if test="${sid != 'admin' }">
		<input type="hidden" name="writer" value="${sid }">
	</c:if>
		<div align="left">
			<font size="5"><b>&nbsp;&nbsp;&nbsp;Write</b></font>
			<hr>
		</div>
		<fieldset>
			<div class="form-group">
				<label for="inputSubject" class="col-lg-2 control-label">Subject</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" placeholder="제목" name="subject" id="inputSubject">
			</div>
			</div>
			<div class="form-group">
				<br><br>
				<label for="textArea" class="col-lg-2 control-label">Content</label>
				<div class="col-lg-10">
					<textarea class="form-control" rows="3" id="textArea" style="resize:none; height : 300px;" name = "content"  placeholder="내용"></textarea>
					<span class="help-block"><font color="black">STUDY53은 비속어 사용을 금지하고 있습니다.</font></span>
				</div>
			</div>
		</fieldset>
		<div align = "right">
		<button class="btn btn-default btn-sm"  type = "submit"><span class="fa fa-pencil" aria-hidden="true"></span></button>
		<button class="btn btn-default btn-sm"  type = "reset" ><span class="fa fa-repeat" aria-hidden="true"></span></button>
		<button class="btn btn-default btn-sm"  type = "button" onclick = "window.location='list.do' "><span class="fa fa-th-list" aria-hidden="true"></span></button>
		</div>

</form>
</div>
</body>
</html>