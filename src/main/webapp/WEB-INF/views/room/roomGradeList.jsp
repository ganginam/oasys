<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      
      <title>boardList.jsp</title>
      
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      
      <!-- [if lt IE 9]>
      <script src="../js/html5shiv.js"></script> 
      <![endif]-->
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
      
      <style type="text/css">
        
      </style>
      
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
      $(function(){
          /* 글쓰기 버튼 클릭시 처리 이벤트 */
          $("#insertFormBtn").click(function(){
        	  location.href="/roomGrade/roomGradeFormGo";
          }); 
          
          /* 제목 클릭 시 상세페이지로 이동을 위한 처리 이벤트 */
          $(".goDetail").click(function(){
             var rg_num = $(this).parents("tr").attr("data-num");
             $("#rg_price").val(rg_num);
             //상세 페이지로 이동하기 위해 form 추가 (id:detailForm)
             $("#detailForm").attr({
                "method":"get",
                "action":"/roomGrade/roomGradeDetail"
             });
             console.log(rg_num)
             $("#detailForm").submit();
          });
       });
      </script>

   </head>
   <body>
      <div class="contentContainer container-fluid">
         <div class="contentTit page-header"><h3 class="text-center">게시판 리스트</h3></div>
         <div id="roomGradeList">
         <form id="detailForm">
            <input type="hidden" id="rg_price" name="rg_price" />
         </form>
            <table class="table table-bordered">
               <colgroup>
                  <col width="20%">
                  <col width="20%">
                  <col width="20%">
                  <col width="20%">
                  <col width="20%">
               </colgroup>
               <thead>
                  <tr>
                     <th>객실 등급</th>
                     <th>객실 가격</th>
                     <th>객실 수용인원</th>
                     <th>객실 평수</th>
                     <th>객실 등록일</th>
                  </tr>
               </thead>
               <tbody id="list" class="table-striped">
                        <c:forEach var="roomgrade" items="${roomGradeList}" varStatus="status">
                           <tr data-num="${roomgrade.rg_price}">
                           		<td class="goDetail">${roomgrade.rg_grade}</td>
                           		<td class="goDetail">${roomgrade.rg_price}</td>
                           		<td class="goDetail">${roomgrade.rg_peoples}</td>
                           		<td class="goDetail">${roomgrade.rg_area}</td>
                           		<td class="goDetail">${roomgrade.rg_date}</td>
                           </tr>
                        </c:forEach>
               </tbody>
            </table>
         </div>
         <div>
            <input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-default">
         </div>
      </div>
   </body>
</html>
