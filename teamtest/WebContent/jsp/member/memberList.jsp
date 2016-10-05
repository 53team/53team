<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
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
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
   <title>member/memberList</title>
</head>
<body>
<br>
<div id="box">
<br>
<c:if test="${vo.count == 1 }">
   <table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
      <tr>
          <td align="center">회원이 없습니다.</td>
      </tr>
   </table>
</c:if>
<c:if test="${vo.count > 1 }">
   <form action = "/teamtest/memberTest.do" onsubmit="return checkDel()">
   <div class="container" style = "width : 760px; max-length : 1920px;">
      <div class="row">
          <div class="col-md-12">
             <div class="table-responsive" id = "border">
	          		<div align="left">
	    				<font size="5"><b>회원목록</b></font>
	    				<hr>
	    			</div>
                   <table style = "align :left; ">
                   <tr>
                      <td style = "width : 680px;">
                      </td>
                      <td>
                         <span class="fa fa-bar-chart-o aria-hidden=true"></span> ${vo.count-1}
                      </td>
                   </tr>
                   </table>
                   <table id="mytable" class="table table-bordred">
                        <tr class = "headings">
                        <c:if test="${sid == 'admin' }">
                        <td width = "30"><input type="checkbox" id="checkAll"/></td>
                        </c:if>
                        <td width = "65px">번호</td>
                        <td width = "150px" align = "center">아이디</td>
                        <td width = "85px" align = "center">이름</td>
                        <td width = "150px" align = "center">핸드폰번호</td>
                        <td width = "250px" align = "center">가입날짜</td>
                        <td width = "70px" align = "center">지역</td>
                        </tr>
         <c:set var="number" value="${vo.number - 1}"/>
         <c:forEach var="list" items="${list}">
            <tr class = "horver1">
               <c:if test="${sid == 'admin' }">
                  <td><input type="checkbox"  name="check" value="${list.id}"></td>
               </c:if>
                  <td align = "center" >${number}<c:set var="number" value="${number - 1}"/></td>
                  <td align = "left" >${ list.id }</td>
                  <td align = "center" >${ list.name }</td>
                  <td align = "center">${ list.phone }</td>
                  <td align = "center" >${list.reg_date }</td>
                  <td align = "center" >${ list.location }</td>
            </tr>
         </c:forEach>
            </table>
               <table align = "right">
                     <tr>   
                        <td colspan="6" align="right">
                           <div class="btn-group">
                                 <button class="btn btn-default btn-sm"  type = "submit"><i class="glyphicon glyphicon-trash"></i></button>
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
   <c:if test="${vo.count > 1 }">
      <c:set var="pageCount" value="${vo.count / vo.pageSize + ( count % pageSize == 0 ? 0 : 1 )}"/>
      <c:set var="startPage" value="${1}"/>
      <c:set var="pageBlock" value="${5}"/>
      <fmt:parseNumber var="result" value="${vo.currentPage / pageBlock }" integerOnly="true"/>
      <c:if test="${(vo.currentPage % pageBlock) != 0 }">
         <c:set var="startPage" value="${result * pageBlock + 1 }"/>
      </c:if>
      <c:if test="${(vo.currentPage % pageBlock) == 0 }">
         <c:set var="startPage" value="${(result - 1) * pageBlock + 1}"/>
      </c:if>
      <c:set var="endPage" value="${startPage + pageBlock - 1}"/>
      <c:if test="${startPage > 5 }">
         <a href="memberList.do?pageNum=${startPage - pageBlock }">[이전]</a>
      </c:if>
      <c:forEach var="i" begin="${startPage }" end="${endPage }">
         <a href="memberList.do?pageNum=${i }">[${i }]</a>
      </c:forEach>
      <c:if test="${endPage < pageCount }">
         <a href="memberList.do?pageNum=${startPage+5 }">[다음]</a>
      </c:if>
   </c:if>
<br><br>
</div>
<br>
</body>
</html>