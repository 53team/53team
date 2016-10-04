<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
</head>
<body>
<div align="center" style = "width : 600px; max-length : 1920px">
<form action = "writePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="${num}">
	<c:if test="${sid == 'admin' }">
	<input type="hidden" name="writer" value="${'관리자'}">
	</c:if>
	<c:if test="${sid != 'admin' }">
	<input type="hidden" name="writer" value="${sid }">
	</c:if>
		<div>
			<div align="left">
	    		<font size="5"><b>Write</b></font>
	    		<hr>
			</div>
				<fieldset>
					<div class="form-group">
						<label for="inputSubject" class="col-lg-2 control-label">Subject</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" placeholder="Subject" name = "subject">
						</div>
					</div>
					<div class="form-group">
						<br> <br>
						<label for="textArea" class="col-lg-2 control-label">Content</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="3" id="textArea" style="resize:none; height : 300px;" name = "content"  placeholder="Content"></textarea>
							<span class="help-block">STUDY53은 비속어 사용을 금지하고 있습니다.</span>
						</div>
					</div>
				</fieldset>
			<div align = "right">
				<button class="btn btn-default btn-sm"  type = "submit"><span class="fa fa-pencil" aria-hidden="true"></span></button>
			   <button class="btn btn-default btn-sm"  type = "reset" ><span class="fa fa-repeat" aria-hidden="true"></span></button>
			   <button class="btn btn-default btn-sm"  type = "button" onclick = "window.location='list.do' "><span class="fa fa-th-list" aria-hidden="true"></span></button>
			</div>
		</div>
</form>
</div>
</body>
</html>