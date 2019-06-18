<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
<div class="col-sm-3 col-md-2 sidebar">

		<ul class="nav nav-sidebar">
         <li class="active mainDepth"><a href="/">관리자 Home<span class="sr-only">(current)</span></a></li>
       </ul>
       <ul class="nav nav-sidebar">
         <li class="mainDepth"><a href="/room/roomList">객실</a></li>

         <li><a href="/room/roomList">객실관리</a></li>
         <li><a href="/roomGrade/roomGradeList">객실등급관리</a></li>

       </ul>
       <ul class="nav nav-sidebar">
         <li class="mainDepth"><a href="/admin/booking/bookingList">예약관리</a></li>
       </ul>
       <ul class="nav nav-sidebar">
         <li class="mainDepth"><a href="/admin/member/memberList">회원</a></li>
         <li><a href="/admin/member/memberList">회원관리</a></li>
         <li><a href="/admin/member/mgrade">회원등급관리</a></li>
       </ul>
       <ul class="nav nav-sidebar">
         <li class="mainDepth"><a href="">게시판</a></li>
         <li><a href="/admin/notice/noticeList">공지사항</a></li>
         <li><a href="/admin/faq/faqList">자주하는 질문</a></li>

         <li><a href="">문의게시판</a></li>
         <li><a href="/admin/review/reviewList">후기</a></li>
       </ul>
</div>