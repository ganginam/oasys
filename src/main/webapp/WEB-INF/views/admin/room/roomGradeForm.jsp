<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
		<link href="/resources/include/css/common.css" rel="stylesheet">
		
		
      
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
		
		<!-- Custom styles for this template -->
    	<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
      
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
      $(function(){
      /*저장 버튼 클릭 시 처리 이벤트*/
      $("#roomGradeInsertBtn").click(function(){
    		$("#f_writeForm").attr({
    			"method":"post",
    			"encType":"multipart/form-data",
    			"action":"/roomGrade/roomGradeInsert"
    		});
    		$("#f_writeForm").submit();
      });
      $("#roomGradeListBtn").click(function(){
    	  location.href="/roomGrade/roomGradeList";
      })
      
      });
      </script>
   </head>
   <body>
      <div class="contentContainer container-fluid">
         <div class="contentTit page-header"><h3 class="text-center">객실(등급) 추가등록</h3></div>
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
						<td class="text-left"><input type="text" name="rg_grade" id="rg_grade" class="form-control" /></td>
                     </tr>
                     <tr>
                        <td>객실 수용인원</td>
                        <td class="text-left"><input type="text" name="rg_peoples" id="rg_peoples" class="form-control" /></td>
                     </tr>
                     <tr>
                        <td>객실 정보</td>
                        <td class="text-left"><textarea name="rg_explain" id="rg_explain" class="form-control" rows="8"></textarea></td>
                     </tr>
                     <tr>
                        <td>객실 평수</td>
                        <td class="text-left"><input type="text" name="rg_area" id="rg_area" class="form-control" /></td>
                     </tr>
                     <tr>
                        <td>객실 가격</td>
                        <td class="text-left"><input type="text" name="rg_price" id="rg_price" class="form-control" /></td>
                     </tr>
                     <tr>
                        <td>객실 이미지1</td>
                        <td class="text-left"><input type="file" name="file[0]" id="rg_image1" class="form-control" /></td>
                     </tr>                                 
                     <tr>                                  
                        <td>객실 이미지2</td>              
                        <td class="text-left"><input type="file" name="file[1]" id="rg_image2" class="form-control" /></td>
                     </tr>                                 
                     <tr>                                  
                        <td>객실 이미지3</td>              
                        <td class="text-left"><input type="file" name="file[2]" id="rg_image3" class="form-control" /></td>
                     </tr>                            
                     <tr>                              
                        <td>객실 이미지4</td>              
                        <td class="text-left"><input type="file" name="file[3]" id="rg_image4" class="form-control" /></td>
                     </tr>                             
                     <tr>                              
                        <td>객실 이미지5</td>             
                        <td class="text-left"><input type="file" name="file[4]" id="rg_image5" class="form-control" /></td>
                     </tr>
                  </tbody>
               </table>
               
               <div class="text-right">
                  <input type="button" value="저장" id="roomGradeInsertBtn"  class="btn btn-primary">
                  <input type="reset" value="취소" id="roomGradeCancelBtn"  class="btn btn-primary">
                  <input type="button" value="목록" id="roomGradeListBtn"  class="btn btn-primary">
               </div>
            </form>
         </div>
      </div>
   </body>
</html>


