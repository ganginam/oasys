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
      		$(function(){
      			$("#btn_back").click(function(){
      				window.history.back();
      			});
      			
      			$("#btn_insert").click(function(){
      				if(!chkData("#re_title", "제목을")) return;
      				else if(!chkData("#re_content", "내용을")) return;
      				else {
      					$("#f_reviewWrite").attr({
      						"method":"post",
      						"action":"/admin/review/reviewInsert"
      					});
      					$("#f_reviewWrite").submit();
      				}
      			});
      		});
      
		</script>
   </head>
   <body>
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href=''> 메뉴대분류이름 </a></li>
                    <li> > </li>
                    <li class="current"><a href='/'>메뉴소분류이름</a></li>
                </ul>
                <h1 class="text-center">후기</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
		<div class="container">
			<form id="f_reviewWrite" name="f_reviewWrite" class="form-horizontal">
				<table class="table table-bordered">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
						<tr>
							<td>작성자</td>
							<td class="text-left"><input type="text" name="re_name" value="${member.m_name}" readonly="readonly"/>(${member.m_id })</td>
						</tr>
						<tr>
							<td>제목</td>
							<td class="text-left"><input type="text" name="re_title" id="re_title" class="form-control"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td class="text-left">
								<textarea rows="8" name="re_content" id="re_content" class="form-control"></textarea>
							</td>
						</tr>
					</tbody>
				</table> 
				
				<div class="text-right">
					<input type="button" value="저장" id="btn_insert" class="btn btn-default"/>
					<input type="reset" value="초기화" class="btn btn-default"/>
					<input type="button" value="뒤로가기" id="btn_back" class="btn btn-default"/>
				</div>
			</form>
		</div>
   </div>
   </body>
</html>