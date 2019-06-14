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
		<script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
				
		<style type="text/css">
			
			
			
		</style>
		<script type="text/javascript">
			$(function(){
				$("#deluxeGoDetail").click(function(){
					location.href = "/roomGrade/showDeluxe";
				});
				
				$("#deluxeDoubleGoDetail").click(function(){
					location.href = "/roomGrade/showDeluxeDubble";
				});
				
				$("#suiteGoDetail").click(function(){
					location.href = "/roomGrade/showSuite";
				});
				
				$("#suiteFamilyGoDetail").click(function(){
					location.href = "/roomGrade/showSuiteFamilly";
				});
			});
		</script>
	</head>
	<body>
		<div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href='/roomGrade/showRooms'>객실 </a></li>
                    <li> > </li>
                    <li class="current"><a href='/roomGrade/showDeluxe'>전체보기</a></li>
                </ul>
                <h1 class="text-center">오아시스 객실 전체보기</h1>
    	</div>
    	<br/><br/><br/><br/><br/>
	<div id="content" class="content content-suite">
		
		<!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette" id="deluxeGoDetail">
        <div class="col-md-7">
          <h2 class="featurette-heading">Deluxe.. <span class="text-muted"> It'll blow your mind.</span></h2>
          <p class="lead">계곡과 바다, 한라산을 모두 조망하는 <em>오아시스 디럭스</em>에서 기운을 재충전하고 차분한 휴식을 만끽해보세요.<br>
			숲을 맴도는 촉촉한 공기와 상쾌하게 차가운 늦은 밤의 미풍까지…</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/resources/images/roomImage/${deluxe.image1}" alt="Generic placeholder image">
        </div>
      </div>
	<br/><br/><br/>
      <hr class="featurette-divider">

      <div class="row featurette" id="deluxeDoubleGoDetail">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/resources/images/roomImage/${deluxeDouble.image1}" alt="Generic placeholder image">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">Deluxe Double... <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">멀리 본다는 것의 의미. 마음이 한결 가벼워집니다.<br>
			<em>디럭스 트윈룸</em>은 아늑한 공간으로 디자인 되었습니다.<br>
			뷰에 따라 푸른 정원, 숲, 계곡, 바다가 시원하게 펼쳐지는 발코니에서는 <br>
			얼굴 위로 쏟아지는 햇살을 받으며 자연의 달콤한 정적을 느끼실 수 있습니다.</p>
        </div>
      </div>
		<br/><br/><br/>
      <hr class="featurette-divider">

      <div class="row featurette" id="suiteGoDetail">
        <div class="col-md-7">
          <h2 class="featurette-heading">Suite <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">계곡과 바다, 한라산을 모두 조망하는 <em>오아시스 스위트</em>에서 기운을 재충전하고 차분한 휴식을 만끽해보세요.<br>
			숲을 맴도는 촉촉한 공기와 상쾌하게 차가운 늦은 밤의 미풍까지…<br>
			180만년 동안 예래가 숨겨놓은 비경을 오롯이 당신의 시간으로 품을 수 있는 공간입니다.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/resources/images/roomImage/${suite.image1}" alt="Generic placeholder image">
        </div>
      </div>
		<br/><br/><br/>
      <hr class="featurette-divider">
      
      <div class="row featurette" id="suiteFamilyGoDetail">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/resources/images/roomImage/${suiteFamilly.image1}" alt="Generic placeholder image">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">Suite Familly ... <span class="text-muted">See for yourself.</span></h2>
          <p class="lead"><em>패밀리 스위트 룸</em>가족과 함께 최고의 시간을 보낼 수 있도록 <br>오아시스가 준비한 특별한 공간입니다.<br>
			아이와 부모 모두 여유롭게 휴식을 취할 수 있도록 편안함을 가장 중요시한 공간입니다. 
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->
	</div>
	</body>
</html>