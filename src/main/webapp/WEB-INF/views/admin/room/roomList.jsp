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
    	  
          /* 글쓰기 버튼 클릭시 처리 이벤트 */
          $("#roomInsertBtn").click(function(){
        	setModal("객실추가등록","insertBtn","등록");
        	dataReset();
			$("#roomModal").modal();
		  });
          /* $(document).on("click","input[name='updateBtn']",function(){
        	  setModal("객실수정","updateBtn","수정");
        	  dataReset();
        	  $("#roomModal").modal();   
        	  var r_number = $(this).parents("tr").attr("data-num");
              $("#r_number").val(r_number);
          }) */
          $(document).on("click","input[name='updateBtn']",function(){
        	  dataReset();
        	  $("#roomUpdateModal").modal();
        	  var r_number = $(this).parents("tr").attr("data-num");
        	  console.log(r_number);
        	  $("#roomUpdateBtn").click(function(){
        		 console.log($("#r_strange").val());
             	 $.ajax({
             		url:"/room/roomUpdate",
             		type:"get",
             		data:"r_number="+r_number+"&r_strange="+$("#r_strange").val(),
             		dataType:"text",
             		error:function(){
             			alert("오루")
             		},
             		success:function(data){
             			if(data=="성공"){
             				alert("이상유무 수정 완료");
                 			location.href="/room/roomList";
             			}else if(data=="실패"){
             				alert("이상유무 수정 실패");
             				location.href="/room/roomList";
             			}
             			
             		}
             	 }) 
               });
          })
          
          
          
          $("#roomBtn").click(function(){
        	  console.log("한번만 찍혀라");
        	  $.ajax({
        		url:"/room/roomInsert",
        		type:"post",
        		data:$("#f_writeForm").serialize(),
        		dataType:"text",
        		error:function(){
        			alert("시스템 오류");
        		},
        		success:function(data){
        			if(data=="성공"){
        				alert("객실 추가등록에 성공하였습니다.")
        				$("#roomModal").modal("hide");
        				location.href="/room/roomList";
        			}else if(data=="실패"){
        				alert("객실 추가등록에 문제가 있어 등록 실패하였습니다");
        				dataReset()
        				location.href="/room/roomList";
        			}
        		}
        	  })
        	  
          })
          
          $(document).on("click","input[name='deleteBtn']",function(){
        	  console.log("??")
        	  if(confirm("선택하신 객실을 삭제하시겠습니까?")){
        		  var r_number = $(this).parents("tr").attr("data-num");
            	  $.ajax({
            		url:"/room/roomDelete",
            		type:"post",
            		data:"r_number="+r_number,
            		dataType:"text",
            		error:function(){
            			alert("시스템 오루")
            		},
            		success:function(data){
            			if(data=="성공"){
            				alert("선택 객실 삭제 완료")
                			location.href="/room/roomList"
            			}else if(data=="실패"){
            				alert("선택 객실 삭제 실패.")
            				location.href="/room/roomList"
            			}
            		}
            	  })
        	  }
          })
          /* 제목 클릭 시 상세페이지로 이동을 위한 처리 이벤트 */
         	$(".goDetail").click(function(){
             var r_number = $(this).parents("tr").attr("data-num");
             $("#r_number").val(r_number);
             //상세 페이지로 이동하기 위해 form 추가 (id:detailForm)
             $("#detailForm").attr({
                "method":"get",
                "action":"/room/roomDetail"
             });
             
             $("#detailForm").submit();
          });
          
          
       });
      
      function setModal(title,value,text){
			$("#roomModalLabel").html(title);
			$("#roomBtn").attr("data-button",value);
			$("#roomBtn").html(text);
		}
      function dataReset(){
			$("#f_writeForm").each(function(){
				this.reset();
			});
		}
      
      </script>

   </head>
   <body>
      <div class="contentContainer container-fluid">
         <div class="contentTit page-header"><h3 class="text-center">객실 리스트</h3></div>
         <div id="roomGradeList">
         <form id="detailForm">
            <input type="hidden" id="r_number" name="r_number" />
         </form>
            <table class="table table-bordered">
               <colgroup>
                  <col width="10%">
                  <col width="10%">
                  <col width="10%">
                  <col width="10%">
                  <col width="20%">
                  <col width="33%">
                  <col width="7%">
               </colgroup>
               <thead>
                  <tr>
                     <th>객실 등급</th>
                     <th>객실 호수</th>
                     <th>객실 가격</th>
                     <th>객실 전망</th>
                     <th>객실 사용여부</th>
                     <th>객실 이상여부</th>
                     <th>수정 및 삭제</th>
                  </tr>
               </thead>
               <tbody id="list" class="table-striped">
                        <c:forEach var="room" items="${roomList}" varStatus="status">
                           <tr data-num="${room.r_number}">
                           		<td class="goDetail">${room.rg_grade}</td>
                           		<td class="goDetail">${room.r_number}</td>
                           		<td class="goDetail">${room.rg_price}</td>
                           		<td class="goDetail">${room.r_view}</td>
                           		<td class="goDetail">${room.r_used}</td>
                           		<td class="goDetail">${room.r_strange}</td>
                           		<td><input type="button" value="수정" name="updateBtn" id="updateBtn" class="btn btn-primary"/>
                           			<input type="button" value="삭제" name="deleteBtn" id="deleteBtn" class="btn btn-primary"/>
                           			</td>
                        	</tr>   
                        </c:forEach>
               </tbody>
            </table>
         </div>
         <p class="text-rigth">
			<button type="button" class="btn btn-primary" id="roomInsertBtn">객실추가등록</button>
		</p>
         <div class="modal fade" id="roomModal" tabindex="-1" role="dialog" aria-labelledby="roomModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="roomModalLabel">객실등록추가</h4>
	      </div>
	      <div class="modal-body">
	        <form id="f_writeForm" name="f_writeForm">
	          <div class="form-group">
	            <label for="rg_grade" class="control-label">객실등급</label>
	            <select name="rg_grade" id="rg_grade">
	            	 <c:forEach var="room" items="${roomGradeList}" varStatus="status">
                     	<option value="${room.rg_grade}">${room.rg_grade}</option>      
                     </c:forEach>
	            </select>
	          </div>
	          <div class="form-group">
	            <label for="r_number" class="control-label">객실호수</label>
	            <input type="text" class="form-control" name="r_number" id="r_number" maxlength="10" />
	          </div>
	          <div class="form-group">
	            <label for="r_view" class="control-label">객실전망</label>
	            <select name="r_view" id="r_view">
	            	<option value="CITY">시티뷰</option>
	            	<option value="RIVER">리버뷰</option>
	            </select>
	          </div>
	          <div class="form-group">
	            <label for="r_strange" class="control-label">객실이상유무</label>
	            <input type="text" class="form-control" name="r_strange" maxlength="10"/>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="roomBtn" data-button="insertBtn">등록</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 수정 모달 -->
	<div class="modal fade" id="roomUpdateModal" tabindex="-1" role="dialog" aria-labelledby="roomUpdateModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="roomUpdateModalLabel">객실수정</h4>
	      </div>
	      <div class="modal-body">
	        <form id="f_writeUpdateForm" name="f_writeUpdateForm">
	          
			  <div class="form-group">
	            <label for="r_strange" class="control-label">객실이상유무</label>
	            <input type="text" name="r_strange" id="r_strange" class="form-control"/>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="roomUpdateBtn">등록</button>
	      </div>
	    </div>
	  </div>
	</div>
      </div>
   </body>
</html>


