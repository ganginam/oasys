<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<title>상세페이지</title>

		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
   		<script type="text/javascript">
   		
   			
   			var rg_num = ${detail.rg_num};
   			$(function(){
   				
   				$("#roomGradeDeleteBtn").click(function(){
   					if(confirm("해당 객실(등급)을 삭제하시겠습니까?")){
   						$.ajax({
   							url:"/roomGrade/roomGradeDelete",
   							type:"post",
   							data:"rg_num="+rg_num,
   							dataType:"text",
   							error:function(){
   								alert("시스템 오류입니다. 개발자에게 문의하세요.")
   							},
   							success:function(data){
   								if(data=="성공"){
   									alert("해당 객실(등급) 삭제완료.");
   									location.href="/roomGrade/roomGradeList";
   								}
   							}
   						})
   					}
   				});
   				$("#updateFormBtn").click(function(){
   					$("#f_data").attr({
   						"method":"get",
   						"encType":"multipart/form-data",
   						"action":"/roomGrade/roomGradeUpdateForm"
   					})
   					$("#f_data").submit();
   		      	});

   			});
		</script>
		<style type="text/css">
			img{
				width:300px;
				height:200px;
			}
		</style>
	</head>
	<body>
		<div class="contentContainer container-fluid"> 
			<div class="contentTit page-header"><h3 class="text-center">게시판 상세보기</h3></div>
			<form name="f_data" id="f_data">
				<input type="hidden" name="rg_num" value="${detail.rg_num}" />
			</form>
			<div class="btnArea col-md-4">
				<input type="button" value="수정" id="updateFormBtn" class="btn btn-success" />
				<input type="button" value="삭제" id="roomGradeDeleteBtn" class="btn btn-success" />
				<input type="button" value="목록" id="roomGradeListBtn" class="btn btn-success" />
			</div>
			<form name="f_updateForm" id="f_updateForm"></form>
			<%--======================상세 정보 보여주기 시작 ==================== --%>
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>	
					<tbody>
						<tr>
							<td>객실 호수</td>
							<td>${detail.r_number}</td>
							<td>등급</td>
							<td>${detail.rg_grade}</td>	
						</tr>
						<tr>
							<td>전망</td>
							<td>${detail.r_view}</td>
							<td>가격</td>
							<td>${detail.rg_price}</td>
						</tr>
						<tr>
							<td>수용인원</td>
							<td>${detail.rg_peoples}</td>
							<td>크기(평수)</td>
							<td>${detail.rg_area}</td>
						</tr>
						<tr>
							<td>이상유무</td>
							<td>${detail.r_strange}</td>
							<td>사용유무</td>
							<td>${detail.r_used}</td>
						</tr>
						<tr class="table-height">
							<td>정보</td>
							<td colspan="3" class="text-left">${detail.rg_explain}</td>
						</tr>				
					</tbody>
				</table>
				<img alt="${detail.image1}" src="/uploadStorage/roomGrade/${detail.image1}"/>
				<img alt="${detail.image2}" src="/uploadStorage/roomGrade/${detail.image2}"/>
				<img alt="${detail.image3}" src="/uploadStorage/roomGrade/${detail.image3}"/>
				<img alt="${detail.image4}" src="/uploadStorage/roomGrade/${detail.image4}"/>
				<img alt="${detail.image5}" src="/uploadStorage/roomGrade/${detail.image5}"/>
			</div>
			
		</div>
	</body>
</html>

