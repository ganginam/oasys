<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      <title>Insert title here</title>
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      <!-- [if lt IE 9]>
      <script src="../js/html5shiv.js"></script> 
      <![endif]-->
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/showroom.css"/>
      
      <!-- Custom styles for this template -->
       <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <style type="text/css">
         
         
         
      </style>
      <script type="text/javascript">
      		var re_num = ${detail.re_num};
      		$(function(){
      			$("#btn_back").click(function(){
      				location.href="/review/reviewList";
      			});
      			
      			$("#btn_delete").click(function(){
      				$.ajax({
      					url:"/review/reviewDelete",
      					type:"post",
      					data:"re_num="+re_num,
      					dataType:"text",
      					error:function(){
      						alert("오류발생");
      					},
      					success:function(data){
      						if(data!=null){
      							alert("삭제완료");
      							location.href="/review/reviewList";
      						}
      					}
      				});
      			});
      		});
      
		</script>
   </head>
   <body>
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href=''>컨시어지</a></li>
                    <li> > </li>
                    <li class="current"><a href='#'>후기</a></li>
                </ul>
                <h1 class="text-center">후기</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
		<div class="container">

			<form id="f_data" name="f_data" method="post">
   				<input type="hidden" name="re_num" value="${detail.re_num }"/>
   			</form>
   			
   			<table class="table table-bordered">
   				<colgroup>
   						<col width="17%"/>
   						<col width="33%"/>
   						<col width="17%"/>
   						<col width="33%"/>
   				</colgroup>
   				<tbody>
   					<tr>
   						<td>작성자</td>
   						<td class="text-left">${detail.re_name }</td>
   						<td>작성일</td>
   						<td class="text-left">${detail.re_date }</td>
   					</tr>
   					<tr>
   						<td>제목</td>
   						<td colspan="3" class="text-left">${detail.re_title }</td>
   					</tr>
   					<tr class="table-height">
   						<td>내용</td>
   						<td colspan="3" class="text-left">${detail.re_content }</td>
   					</tr>
   				</tbody>
   			</table>
   			
   			<div class="btnArea text-right">
   				<input type="button" value="목록" id="btn_back" class="btn btn-default"/>
   				<!-- <input type="button" value="삭제" id="btn_delete" class="btn btn-default"/> -->
   			</div>	
		</div>
   </div>
   </body>
</html>