<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>freeboard/content</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />

</head> 
<body>
<br>
<div class="tab-content" align = "center" id="whitebox">
<br>
  <div class="tab-pane active" id="inbox">
      <div class="container" style = "width : 700px;" >
           <div class="content-container clearfix">
               <div class="col-md-12">
                   <div align = "left">
                   		<table>
                   			<tr>
                   				<td align="left" width="500px">
									<font size = "5px"><b>${subject }</b></font> <font color = "gray">｜</font-color><a href = "list.do">content</a>
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
                      <textarea readonly="readonly" style = "background-color:rgb(232, 232, 232); width : 650px; height:300px; outline-style:none; border:0; resize: none;">${content }
                      </textarea>
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
					
					<!-- 덧글부분 -->
					
					<div align = "left">
						<font color = "red">덧글(${count })</font>
						<br>
						<hr>
					</div>
					
					<c:forEach var="list" items="${list}">
						<div align = "left">
							<font color = "black">
							<c:if test="${list.re_writer != '관리자' }">
							${list.re_writer}
							</c:if>
							<c:if test="${list.re_writer == '관리자' }">
							<b>${list.re_writer}</b>
							</c:if>
							&nbsp;&nbsp;&nbsp;${list.re_reg_date }
							</font>
						<div style = "width : 600px; resize : none">
							${list.re_content }
						</div>
						</div>
						
						<!-- 삭제부분 -->
						<div align = "right">
							<c:if test="${sid == list.re_writer || sid == 'admin'}">
								<button class="btn btn-default btn-sm"  type = "button" onclick = " document.location.href='replyDeleteForm.do?re_num=${list.re_num}&reply_num=${list.reply_num}' "><i class="glyphicon glyphicon-trash"></i></button>
								<hr>
								<br>
							</c:if>
						</div>
						
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
								<input type = "text" style = "width : 650px; height : 60px; "  readonly="readonly" value = "로그인 필수.">
							</c:if>
							<c:if test = "${sid != null }">
								<input type="text" name="re_content" style = "width : 600px; height : 60px;">
							</c:if>
						</td>
						<c:if test = "${sid != null }">
						<td>
						&nbsp;<button class="btn btn-default btn-sm" type = "submit"><i class="fa fa-comment"></i><span class="icon-name"></span></button>
						</td>
						</c:if>
						</tr>
						</table>
						</form>
						</div>
				</div>
			</div>
		</div>
<br>
	</div>
<br>
</body>
</html>