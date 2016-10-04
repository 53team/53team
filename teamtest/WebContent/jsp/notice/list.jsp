<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.headings {
	background: rgba(52,73,94,0.94);
	color: #ECF0F1;
}
.freeboardfont1 {
    font-weight: 900;
    font-size: 30px;
	font-family: Browallia New;
}
.horver1:hover{
	cursor:pointer;
	background-color:#CCCCCC;
}
.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}
hr {
	margin-top: 0px;
}
a {
	color: black;
	text-decoration: none;
}
</style>
<title>notice/list</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
</head>
<body>
<br>
<div id="box">
<br>
<c:if test="${vo.count >= 0}">
	<form action="/teamtest/freeboardTest(notice).do" name="checkbox" onsubmit="return checkDel()">
	<div class="container" style = "width : 1005px; max-length : 1920px;">
		<div class="row">
		    <div class="col-md-12">
			    <div class="table-responsive" id = "border">
			    		<div align="left">
			    		<font size="5"><b>공지사항</b></font>
			    		<hr>
			    		</div>
						<div align = "right" ><span class="fa fa-bar-chart-o aria-hidden=true"></span> ${vo.count}</div>
			          <table id="mytable" class="table table-bordred">
			               <tr class = "headings">
			               <c:if test="${sid == 'admin' }">
			               <td width = "30"><input type="checkbox" id="checkAll"/></td>
			               </c:if>
			               <td width = "55px">번호</td>
			               <td width = "500px" align = "center">글제목</td>
			               <td width = "75px" align = "center">작성자</td>
			               <td width = "300px" align = "center">작성일</td>
			               <td width = "75px" align = "center">조회수</td>
			               </tr>
			<c:set var="number" value="${vo.number}"/>
			<c:if test="${vo.count == 0}">
				<tr>
					<td colspan = "6" align = "center">
						게시판에 저장된 글 이 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${list}">
				<tr class = "horver1">
					<c:if test="${sid == 'admin' }">
						<td><input type="checkbox"  name="check" value="${list.num}"></td>
					</c:if>
						<td align = "center" onclick = "location.href = 'content(notice).do?num=${list.num}' ">${number}<c:set var="number" value="${number - 1}"/></td>
						<td align = "left" onclick = "location.href = 'content(notice).do?num=${list.num}' "><a href="content(notice).do?num=${list.num}">${list.subject}</a>${count1}</td>
						<td align = "center" onclick = "location.href = 'content(notice).do?num=${list.num}' "><b>${list.writer}</b></td>
						<td align = "center" onclick = "location.href = 'content(notice).do?num=${list.num}' ">${list.reg_date }</td>
						<td align = "center" onclick = "location.href = 'content(notice).do?num=${list.num}' ">${list.readnum}</td>
				</tr>
			</c:forEach>
				</table>
					<table align = "right">
							<tr>	
								<td colspan="6" align="right">
									<div class="btn-group">
										<c:if test="${sid == 'admin' }">
											<button class="btn btn-default btn-sm"  type = "submit"><i class="glyphicon glyphicon-trash"></i></button>
											<a href="writeForm(notice).do"><button class="btn btn-default btn-sm"  type = "button"><span class="fa fa-pencil" aria-hidden="true"></span></button></a>
										</c:if>
									</div>
								</td>	
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</c:if>
<form action="list(notice).do" name="search" method="get" onsubmit="return searchCheck()">
<table align="center" cellpadding="4" cellspacing="0">
   <c:if test="${vo.count > 0}">
   <tr>
      <td colspan="3" align="center">
         <c:set var="pageCount" value="${vo.count / vo.pageSize + (count % pageSize == 0 ? 0 : 1)}"/>
         <c:set var="startPage" value="${1}"/>
         <c:set var="pageBlock" value="${5}"/>
         <fmt:parseNumber var="rs" value="${vo.currentPage / pageBlock}" integerOnly="true" />
         <c:if test="${(vo.currentPage % pageBlock) != 0 }">
            <c:set var="startPage" value="${rs * pageBlock + 1 }"/>
         </c:if>
         <c:if test="${(vo.currentPage % pageBlock) == 0 }">
            <c:set var="startPage" value="${(rs - 1) * pageBlock + 1}"/>
         </c:if>
         <c:set var="endPage" value="${startPage + pageBlock - 1}"/>
         <c:if test="${startPage > 5 }">
            <a href="list(notice).do?pageNum=${startPage - pageBlock }&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[이전]</a>
         </c:if>
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <a href="list(notice).do?pageNum=${i}&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[${i}]</a>
         </c:forEach>
         <c:if test="${endPage < pageCount }">
            <a href="list(notice).do?pageNum=${startPage + pageBlock}&keyField=${vo.keyField}&keyWord=${vo.keyWord}">[다음]</a>
         </c:if>
         </td>
      </tr>
      </c:if>
      </table>
      </form>
<br>
<form action="list(notice).do" name="search" method="post" onsubmit="return searchCheck()" class="form-inline" >
		<select name="keyField" class="form-control">
   			<c:if test="${vo.keyField == 'subject'}"><option value="subject" selected="selected">제목</option></c:if>
   			<c:if test="${vo.keyField != 'subject'}"><option value="subject">제목</option></c:if>
   			<c:if test="${vo.keyField == 'content'}"><option value="content" selected="selected">내용</option></c:if>
   			<c:if test="${vo.keyField != 'content'}"><option value="content">내용</option></c:if>
		</select>
		
		<div class="input-group custom-search-form">
			<input type="text" class="form-control" placeholder="검색어" name="keyWord" value="${vo.keyWord}"/>
			<span class="input-group-btn">
				<button class="btn btn-default" type="submit" name="search">
					<i>search</i>
				</button>
			</span>
		</div>
</form>
<br>
</div>
<br>
</body>
</html>