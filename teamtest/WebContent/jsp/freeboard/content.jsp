<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>freeboard/content</title>
</head> 
<body>
<br>
<div class="tab-content" align="center" id="middlebox">
<br>
<font style="font-family: 맑은고딕;">
	<div class="container" style = "width : 700px;">
		<div class="content-container clearfix">
			<div class="col-md-12">
				<div align="left">
                  		<table>
                  			<tr>
                  				<td align="left" width="500px">
								<font size="5px"><b>${subject }</b></font> <font color = "gray">｜</font><a href="list.do">free</a>
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
					<c:if test="${sid == writer || sid == 'admin'}">
						<button class="btn btn-default btn-sm"  type = "button" onclick = "document.location.href='updateForm.do?num=${num}'"><span class="fa fa-pencil-square-o"></span></button>
						<button class="btn btn-default btn-sm"  type = "button" onclick = "document.location.href='deleteForm.do?num=${num}'"><i class="glyphicon glyphicon-trash"></i></button>
					</c:if>
					<button class="btn btn-default btn-sm"  type = "button" onclick = "window.location='list.do' " >
                        <span class="fa fa-th-list" aria-hidden="true"></span>
					</button>
				</div>
									
				<div align = "left">
					<font color = "red">댓글(${count })</font>
					<br>
					<hr>
				</div>
				<c:forEach var="list" items="${list}">
					<table width="600px">
						<tr>
							<td>
								<b>${list.re_writer}</b>
							</td>
							<td align="right">
								<font size="1">
									${list.re_reg_date }
								</font>
							</td>
						<tr>
						<tr>
							<td>
								${list.re_content }
							</td>
							<td align="right">
								<c:if test="${sid == list.re_writer || sid == 'admin'}">
									<button class="btn btn-default btn-sm"  type="button" onclick="document.location.href='replyDeleteForm.do?re_num=${list.re_num}&reply_num=${list.reply_num}' "><i class="glyphicon glyphicon-trash"></i></button>
								</c:if>
							</td>
						</tr>
					</table>
					<br>
				</c:forEach>
				<form action="replyPro.do" method="post" name="reply" onsubmit="return check()">
					<input type="hidden" name="re_num" value="${re_num}">
					<c:if test="${sid == 'admin' }">
						<input type="hidden" name="re_writer" value="${'관리자'}">
					</c:if>
					<c:if test="${sid != 'admin' }">
						<input type="hidden" name="re_writer" value="${sid }">
					</c:if>
					<input type="hidden" name="reply_num" value="${reply_num}">
					<table align = "left" >
						<tr>
						<td>
							<c:if test="${sid == null }">
								<input type="text" style="width : 580px;"  readonly value = "로그인 후 이용할 수 있습니다.">
							</c:if>
							<c:if test = "${sid != null }">
								<input type="text" name="re_content" style = "width : 590px;">
							</c:if>
						</td>
							<c:if test = "${sid != null }">
								<td>
									&nbsp;
									<button class="btn btn-default btn-sm" type="submit">
										<i class="fa fa-comment"></i>
										<span class="icon-name"></span>
									</button>
								</td>
							</c:if>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</font>
<br>
</div>
<br>
</body>
</html>