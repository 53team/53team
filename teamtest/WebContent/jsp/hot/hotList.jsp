<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.panel-green {
  border-color: #5cb85c;
}
.panel-green > .panel-heading {
  border-color: #5cb85c;
  color: white;
  background-color: #5cb85c;
}

.panel-green > a {
  color: #5cb85c;
}
.panel-green > a:hover {
  color: #3d8b3d;
}
.panel-red {
  border-color: #d9534f;
}
.panel-red > .panel-heading {
  border-color: #d9534f;
  color: white;
  background-color: #d9534f;
}
.panel-red > a {
  color: #d9534f;
}
.panel-red > a:hover {
  color: #b52b27;
}
.panel-yellow {
  border-color: #f0ad4e;
}
.panel-yellow > .panel-heading {
  border-color: #f0ad4e;
  color: white;
  background-color: #f0ad4e;
}
.panel-yellow > a {
  color: #f0ad4e;
}
.panel-yellow > a:hover {
  color: #df8a13;
}
.huge {
  font-size: 40px;
}
.pull-black {
   font-color : #5cb85c;
}
body {
   align : center;
}

</style>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
</head>
<body>
<!-- C:SET -->
<c:set var = "sums" value = "${vector[0].count + vector[1].count + vector[2].count + vector[3].count + vector[4].count }"></c:set>
<c:set var = "first" value = "${(vector[0].count / sums) * 100 }"></c:set>
<c:set var = "second" value = "${(vector[1].count / sums) * 100 }"></c:set>
<c:set var = "third" value = "${(vector[2].count / sums) * 100 }"></c:set>
<c:set var = "fourth" value = "${(vector[3].count / sums) * 100 }"></c:set>
<c:set var = "fifth" value = "${(vector[4].count / sums) * 100 }"></c:set>
<!-- C:SET end -->

<!-- <div style = "align : center;"> -->
   
   <div id = "banner">
   <div class = "col-lg-2 col-md-3 inner" style = "width : 260px;">
   
   </div>
      <!-- 회원수 패널 -->
       <div class="col-lg-2 col-md-6 inner" style = "width : 200px;">
           <div class="panel-red">
               <div class="panel-heading">
                   <div class="row">
                       <div class="col-xs-3">
                           <i class="fa  fa-user fa-5x"></i>
                       </div>
                       <div class="col-xs-9 text-right">
                           <div class="huge">${usercount - 1 }</div>
                           <div>Total Member</div>
                       </div>
                   </div>
               </div>
               <c:if test="${sid == 'admin' }">
               <a href="memberList.do">
                   <div class="panel-footer">
                       <span><font style = "color : #d9534f;">User</font></span>
                       <span style = "color : #d9534f;"><i class="fa fa-arrow-circle-right"></i></span>
                       <div class="clearfix"></div>
                   </div>
                </a>
                </c:if>
                <c:if test="${sid != 'admin' }">
                   <div class="panel-footer">
                       <span><font style = "color : #d9534f;">User</font></span>
                       <div class="clearfix"></div>
                   </div>
                </c:if>
           </div>
       </div>
       <!-- 회원수 end -->

      <!-- 스터디룸수 패널 -->
       <div class="col-lg-2 col-md-6 inner" style = "width : 200px;">
           <div class="panel-green">
               <div class="panel-heading">
                   <div class="row">
                       <div class="col-xs-3">
                           <i class="fa fa-tasks fa-5x"></i>
                       </div>
                       <div class="col-xs-9 text-right">
                           <div class="huge">${sums }</div>
                           <div>Total StudyRoom</div>
                       </div>
                   </div>
               </div>
               <a href="roomList.do">
                   <div class="panel-footer">
                       <span><font style = "color : #5cb85c;">Study Room</font></span>
                       <span style = "color : #5cb85c;"><i class="fa fa-arrow-circle-right"></i></span>
                       <div class="clearfix"></div>
                   </div>
               </a>
           </div>
       </div>
       <!-- 스터디룸 수 end -->
       
       <!-- 카테고리수 bar차트 -->
       <div class="inner">
       <div class="col-sm-4" style = " align : center;">
       <div class="panel-yellow" sty>
           <div class="panel-heading" style = "width : 330px; height : 180px; align : center; padding-top: 0">
         <font style = "color : white; font-weight : bold;">Top ProgramLanguage</font><br>
         <table width="300px">
         	<tr>
         		<td width="25%">
         			<div class="pull-left" style=" line-height:1;">
               		<div style="height:9px; margin:5px 0;"><font style = "color :white; font-weight : bold; font-size : 15px;">${vector[0].category }</font></div>
            		</div>
         		</td>
         		<td width="60%">
         			<div class="pull-left" style="width:180px;">
		               		<div class="progress" style="height:9px; margin:8px 0;">
		                 	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: ${first}%">
		                 	</div>
	               		</div>
            		</div>
         		</td>
         		<td width="15%" align="left">
         		 	<div align="left" style="margin-left:10px;"><font color="#fff">${vector[0].count }</font></div>
         		</td>
         	</tr>
         	<tr>
         		<td width="25%">
         			<div class="pull-left" style=" line-height:1;">
		               <div style="height:9px; margin:5px 0;"><font style = "color :white; font-weight : bold; font-size : 15px;">${vector[1].category }&nbsp;&nbsp;</font></div>
		            </div>
         		</td>
         		<td width="60%">
         			<div class="pull-left" style="width:180px;">
		               <div class="progress" style="height:9px; margin:8px 0;">
		                 <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="4" aria-valuemin="0" aria-valuemax="5" style="width: ${second}%">
		                 </div>
		               </div>
		            </div>
         		</td>
         		<td width="15%" align="left">
         			<div align="left" style="margin-left:10px;"><font color="#fff">${vector[1].count }</font></div>
         		</td>
         	</tr>
         	<tr>
         		<td width="25%">
         			<div class="pull-left" style="line-height:1;">
		               <div style="height:9px; margin:5px 0;"><font style = "color :white; font-weight : bold; font-size : 15px;">${vector[2].category }&nbsp;&nbsp;</font></div>
		            </div>
         		</td>
         		<td width="60%">
         			<div class="pull-left" style="width:180px;">
		               <div class="progress" style="height:9px; margin:8px 0;">
		                 <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="3" aria-valuemin="0" aria-valuemax="5" style="width: ${third}%">
		                 </div>
		               </div>
		            </div>
         		</td>
         		<td width="15%" align="left">
         			<div align="left" style="margin-left:10px;"><font color="#fff">${vector[2].count }</font></div>
         		</td>
         	</tr>
         	<tr>
         		<td width="25%">
         			<div class="pull-left" style="line-height:1;">
		               <div style="height:9px; margin:5px 0;"><font style = "color :white; font-weight : bold; font-size : 15px;">${vector[3].category }&nbsp;&nbsp;</font></div>
		            </div>
         		</td>
         		<td width="60%">
         			<div class="progress" style="height:9px; margin:8px 0;">
	                 <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="5" style="width: ${fourth}%">
	                 </div>
	               </div>
         		</td>
         		<td width="15%" align="left">
         			<div align="left" style="margin-left:10px;"><font color="#fff">${vector[3].count }</font></div>
         		</td>
         	</tr>
         	<tr>
         		<td width="25%">
         			<div class="pull-left" style="line-height:1;">
		               <div style="height:9px; margin:5px 0;"><font style = "color :white; font-weight : bold; font-size : 15px;">${vector[4].category }&nbsp;&nbsp;</font></div>
		            </div>
         		</td>
         		<td width="60%">
         			<div class="progress" style="height:9px; margin:8px 0;">
	                 <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5" style="width: ${fifth}%">
	                 </div>
	               </div>
         		</td>
         		<td width="15%" align="left">
         			<div align="left" style="margin-left:10px;"><font color="#fff">${vector[4].count }</font></div>
         		</td>
         	</tr>
         </table>
      </div>
      </div>
      </div>
      </div>
       <!-- 카테고리수 bar차트 end -->
       </div>
</body>
</html>