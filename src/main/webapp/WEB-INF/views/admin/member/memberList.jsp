<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				var word = "<c:out value = '${data.keyword}'/>";
				var value = "";
				if(word!=""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					if($("#search").val()=='m_name') value = "#list tr td.mbName";
					else if($("#search").val()=='m_phone') value="#list tr td.mbPhone";
					else if($("#search").val()=='m_id') value="#list tr td.mbId";
					else if($("#search").val()=='m_email') value="#list tr td.mbEmail";
					$(value+":contains('"+word+"')").each(function(){
						var regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
					});
				}
				
				$("#mSearch").change(function(){
					if($("#search").val()=="allMember"){
						$("#keyword").val("전체 회원 조회합니다.");
					}else if($("#mSearch").val()!="allMember"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				$("#searchData").click(function(){
					if($("#search").val()!="all"){
						if(!chkData("#keyword", "검색어를")) return;
					}
					goPage();
				});
				
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_mSearch").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				//회원 클릭 시 회원 상세페이지 이동
				$(".memberTr").click(function(){
					var m_no = $(this).attr("data-num");
					console.log("click m_no : " + m_no);
					
					location.href="/admin/member/memberDetail?m_no="+m_no;
				});
				
				
				
				//관리자
				var admin_no = 0;
				
				$("#adminInsertBtn").click(function(){
					$("#adminModal").modal();
				});
				
				$(".adminRadio").click(function(){
					admin_no = $(this).parents("tr").attr("data-num");
					//var admin_no = $('input[name="adminRadio"]:checked').val();
					console.log("check adminRadio m_no: " + admin_no)
				});
				
				$("#adminDeleteBtn").click(function(){
					if(admin_no==0){
						alert("탈퇴 처리할 관리자를 선택하세요.");
					}else{
						$.ajax({
							url : "/admin/member/adminDelete",
							type : "post",
							data : "m_no=" + admin_no,
							error : function(){
								alert('시스템 오류입니다. 관리자에게 문의하세요.');
							},
							success : function(resultData){
								if(resultData=="성공"){
									alert("선택된 관리자가 탈퇴 완료되었습니다.")
								}else{
									alert("관리자 탈퇴 오류..");
									return;
								}
							}
						});
						admin_no = 0;
					}
				});
				
				
				
			}); //최상위 function 종료 
			
			 /* $(document).ready(function () {
				 $("#adminRadio").click(function(){
					var admin_no = $('input[name="adminRadio"]:checked').val();
					console.log("check adminRadio m_no: " + admin_no)
				});
			 }); */
			
			
			function goPage(){
				if($("#search").val()=="allMember"){
					$("#keyword").val("");
				}
				$("#f_mSearch").attr({
					"method":"get",
					"action":"/admin/member/memberList"
				});
				$("#f_mSearch").submit();
			}
		</script>
		
		
	</head>
	<body>
		<div class="contentContainer container-fluidA">


			<!-- 회원 조회 기능 ----------------------->
			<div class="contentTit page-header"><h3 class="text-center">회원 조회</h3></div>
			
			<!-- 회원 검색 부분 -->
			<div id="memberSearch" class="text-right">
				<form id="f_mSearch" name="f_mSearch" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="allMember">전체회원</option>
							<option value="m_name">이름</option>
							<option value="m_phone">전화번호</option>
							<option value="m_id">아이디</option>
							<option value="m_email">이메일</option>
						</select>
						<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" class="form-control" />
						<button type="button" id="searchData" class="btn btn-primary btn-sm">검색</button>
					</div>
				</form>
			</div>
			
			
			<form id="detailForm">
				<input type="hidden" id="m_num" name="m_num" />
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}" />
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}" />
			</form>
			
			<div>
				<table class="table table-bordered table-hover">
					<colgroup>
						<col width="4%">
						<col width="5%">
						<col width="4%">
						<col width="6%">
						<col width="4%">
						<col width="10%">
						<col width="10%">
						<col width="8%">
						<col width="10%">
						<col width="15%">
						<col width="8%">
						<col width="6%">
						<col width="8%">
					</colgroup>
					<thead>
						<tr>
							<th>분류</th>
							<th>회원번호</th>
							<th>등급</th>
							<th>이름</th>
							<th>성별</th>
							<th>아이디</th>
							<th>비밀번호 변경일</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>생일</th>
							<th>연간 누적 금액</th>
							<th>총 누적 금액</th>
							<th>가입날짜</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty memberList}">
								<c:forEach var="member" items="${memberList}" varStatus="status">
									<tr class="memberTr" data-num="${member.m_no}">
										<td>${member.m_type}</td>
										<td>${member.m_no}</td>
										<td>${member.mg_grade}</td>
										<td class="mbName">${member.m_name}</td>
										<td>${member.m_gender}</td>
										<td class="mbId">${member.m_id}</td>
										<td>${member.m_pwdchanged}</td>
										<td class="mbPhone">${member.m_phone}</td>
										<td class="mbEmail">${member.m_email}</td>
										<td>${member.m_birth}</td>
										<td>${member.m_ytotal}</td>
										<td>${member.m_total}</td>
										<td>${member.m_joindate}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="13">회원이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<!-- 회원 조회 페이징처리 -->
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage +1}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			
			
			
			
			<!-- 관리자 조회 기능 ----------------------->
			<div class="contentTit page-header"><h3 class="text-center">관리자 조회</h3></div>
			<div>
				<table class="table table-bordered">
					<colgroup>
						<col width="3%">
						<col width="5%">
						<col width="5%">
						<col width="6%">
						<col width="4%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>선택</th>
							<th>분류</th>
							<th>회원번호</th>
							<th>이름</th>
							<th>성별</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>생일</th>
							<th>가입날짜</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty adminList}">
								<c:forEach var="admin" items="${adminList}" varStatus="status">
									<tr class="tac" data-num="${admin.m_no}">
										<td><input type="radio" class="adminRadio" name="adminRadio" value="${admin.m_no}"/></td>
										<td>${admin.m_type}</td>
										<td>${admin.m_no}</td>
										<td>${admin.m_name}</td>
										<td>${admin.m_gender}</td>
										<td>${admin.m_id}</td>
										<td>**********</td>
										<td>${admin.m_phone}</td>
										<td>${admin.m_email}</td>
										<td>${admin.m_birth}</td>
										<td>${admin.m_joindate}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="11">관리자가 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<div>
				<input type="button" value="관리자 등록" id="adminInsertBtn" class="btn btn-default">
				<!-- <input type="button" value="수정" id="insertFormBtn" class="btn btn-default"> -->
				<input type="button" value="삭제" id="adminDeleteBtn" class="btn btn-default">
			</div>
		</div>
		
		<!-- 관리자 등록 화면 영역(modal) -->
		<div class="modal fade" id="adminModal" tabindex="-1" role="dialog" aria-labelledby="adminModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="adminModalLabel">관리자 등록</h4>
					</div>
					<div class="modal-body">
						<form id="comment_form" name="comment_form">
							<div class="form-group">
						    	<label for="m_name" class="control-label">이름</label>
						    	<input type="text" class="form-control" name="m_name" id="m_name" />
						    </div>
						    <div class="form-group">
						    	<label for="m_name" class="control-label">아이디</label>
						    	<input type="text" class="form-control" name="m_id" id="m_id" />
						    </div>
						    <div class="form-group">
								<label for="g_pwd" class="control-label">비밀번호</label>
								<input type="password" class="form-control" name="m_pwd" id="m_pwd" />
						    </div>
						    <div class="form-group">
						    	<label for="m_name" class="control-label">성별</label>
						    	<select>
						    		<option>남자</option>
						    		<option>여자</option>
						    	</select>
						    </div>
						    <div class="form-group">
						    	<label for="m_name" class="control-label">전화번호</label>
						    	<input type="text" value="010"> - 
						    	<input type="text" name="m_phone1" id="m_phone1" /> - 
						    	<input type="text" name="m_phone2" id="m_phone2" />
						    </div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="adminInsertBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>