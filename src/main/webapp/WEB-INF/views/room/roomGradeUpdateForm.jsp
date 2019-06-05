<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      
      <title>writeForm.jsp</title>
      
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      
      <!-- [if lt IE 9]>
      <script src="../js/html5shiv.js"></script> 
      <![endif]-->
      
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      
      <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
      	$(function(){
      		/* $("#roomGradeUpdateBtn").click(function(){
      			$("#f_writeForm").ajaxForm({
      				url:"/roomGrade/roomGradeUpdate",
      				type:"post",
      				encType:"multipart/form-data",
      				dataType:"text",
      				error:function(){
      					alert("시스템 오류");
      				},
      				success:function(data){
      					if(data=="성공"){
      						location.href="/roomGrade/roomGradeDetail";
      					}else{
      						location.href="/roomGrade/roomGradeList"
      					}
      				}
      			})
      			$("#f_writeForm").submit();
      		}); */
      		
      		$("#roomGradeUpdateBtn").click(function(){
      			$("#f_writeForm").attr({
      				"method":"post",
      				"encType":"multipart/form-data",
      				"action":"/roomGrade/roomGradeUpdate"
      			})
      			$("#f_writeForm").submit();
      		})
      	})
      </script>
      <style type="text/css">
      	img{
      		width:500px;
      		height:200px;
      	}
      </style>
   </head>
   <body>
      <div class="contentContainer container-fluid">
         <div class="contentTit page-header"><h3 class="text-center">게시판 글작성</h3></div>
         <div class="contentTB text-center">
            <form id="f_writeForm" name="f_writeForm" class="form-horizontal">
               <table class="table table-bordered">
                  <colgroup>
                     <col width="20%" />
                     <col width="80%" />
                  </colgroup>
                  <tbody>
                     <tr>
                        <td>객실 등급설정</td>
                        
						<td class="text-left"><input type="text" name="rg_grade" id="rg_grade" value="${detail.rg_grade}" class="form-control" />${updateData.rg_grade}</td>
						
                     </tr>
                     <tr>
                        <td>객실 수용인원</td>
                        <td class="text-left"><input type="text" name="rg_peoples" id="rg_peoples" value="${detail.rg_peoples }" class="form-control" /></td>
                     </tr>
                     <tr>
                        <td>객실 정보</td>
                        <td class="text-left"><textarea name="rg_explain" id="rg_explain" class="form-control" rows="8">${detail.rg_explain}</textarea></td>
                     </tr>
                     <tr>
                        <td>객실 평수</td>
                        <td class="text-left"><input type="text" name="rg_area" id="rg_area" class="form-control" value="${detail.rg_area}" /></td>
                     </tr>
                     <tr>
                        <td>객실 가격</td>
                        <td class="text-left"><input type="text" name="rg_price" id="rg_price" class="form-control" value="${detail.rg_price}" /></td>
                     </tr>
                     <tr>
                        <td>객실 이미지1</td>
                        <td class="text-left"><input type="file" name="file[0]" id="image1" class="form-control"  />
                        <input type="hidden" name="image1" value="${detail.image1}"/>
                        <img src="/uploadStorage/roomGrade/${detail.image1}">
                        </td>
                     </tr>                                 
                     <tr>                                  
                        <td>객실 이미지2</td>              
                        <td class="text-left"><input type="file" name="file[1]" id="image2" class="form-control"  />
                        <input type="hidden" name="image2" value="${detail.image2}"/>
                        <img src="/uploadStorage/roomGrade/${detail.image2}">
                        </td>
                     </tr>                                 
                     <tr>                                  
                        <td>객실 이미지3</td>              
                        <td class="text-left"><input type="file" name="file[2]" id="image3" class="form-control"/>
                        <input type="hidden" name="image3" value="${detail.image3}"/>
                        <img src="/uploadStorage/roomGrade/${detail.image3}">
                        </td>
                     </tr>                            
                     <tr>                              
                        <td>객실 이미지4</td>              
                        <td class="text-left"><input type="file" name="file[3]" id="image4" class="form-control"/>
                        <input type="hidden" name="image4" value="${detail.image4}"/>
                        <img src="/uploadStorage/roomGrade/${detail.image4}">
                        </td>
                     </tr>                             
                     <tr>                              
                        <td>객실 이미지5</td>             
                        <td class="text-left">
                        <input type="file" name="file[4]" id="image5" class="form-control"/>
                        <input type="hidden" name="image5" value="${detail.image5}"/>
                        <img src="/uploadStorage/roomGrade/${detail.image5}">
                        </td>
                     </tr>
                  </tbody>
               </table>
               
		        <div class="contentBtn text-right">
					<input type="button" value="수정" id="roomGradeUpdateBtn" class="btn btn-success" />
					<input type="button" value="취소" id="roomGradeCancelBtn" class="btn btn-success" />
					<input type="button" value="목록" id="roomGradeListBtn" class="btn btn-success" />
				</div>
            </form>
         </div>
      </div>
   </body>
</html>


