<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>notice/content</title>
</head> 
<body>
<br>
<div class="tab-content" align="center" id="middlebox">
<br>
<font style="font-family: 맑은고딕;">
	<div class="container" style="width : 700px;">
		<div class="content-container clearfix">
			<div class="col-md-12">
				<div align="left">
					<table>
						<tr>
							<td align="left" width="500px">
							<font size="5px"><b>${subject }</b></font> <font color = "gray">｜</font><a href="list(notice).do">Notice</a>
							</td>
							<td>
                  				<div align = "right">
									<b>${writer }</b>
								</div>
								<div align = "right">
									${reg_date }
								</div>
							</td>
						</tr>
					</table>
				<hr>
			</div>
			<div align = "left">
				<textarea readonly style = "background-color:rgb(232, 232, 232); width : 650px; height:300px; outline-style:none; border:0; resize: none;">${content }</textarea>
				</div>
			<div align = "right">
				<br>
				<c:if test="${sid == 'admin'}">
					<button class="btn btn-default btn-sm"  type = "button" onclick = "document.location.href='updateForm(notice).do?num=${num}'"><span class="fa fa-pencil-square-o"></span></button>
					<button class="btn btn-default btn-sm"  type = "button" onclick = "document.location.href='deleteForm(notice).do?num=${num}'"><i class="glyphicon glyphicon-trash"></i></button>
				</c:if>
				<button class="btn btn-default btn-sm"  type = "button" onclick = "window.location='list.do' " >
					<span class="fa fa-th-list" aria-hidden="true"></span>
				</button>
			</div>
			</div>
		</div>
	</div>
</font>
<br>
</div>
<br>
</body>
</html>