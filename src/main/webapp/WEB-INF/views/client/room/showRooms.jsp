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
                    <li><a href='#'>객실 </a></li>
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
          <img class="featurette-image img-responsive" src="/uploadStorage/roomGrade/${deluxe.image1}" alt="Generic placeholder image">
        </div>
      </div>
	<br/><br/><br/>
      <hr class="featurette-divider">

      <div class="row featurette" id="deluxeDoubleGoDetail">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/uploadStorage/roomGrade/${deluxeDouble.image1}" alt="Generic placeholder image">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">Deluxe Double... <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">계곡과 바다, 한라산을 모두 조망하는 <em>오아시스 디럭스</em>에서 기운을 재충전하고 차분한 휴식을 만끽해보세요.<br>
			숲을 맴도는 촉촉한 공기와 상쾌하게 차가운 늦은 밤의 미풍까지…</p>
        </div>
      </div>
		<br/><br/><br/>
      <hr class="featurette-divider">

      <div class="row featurette" id="suiteGoDetail">
        <div class="col-md-7">
          <h2 class="featurette-heading">Suite <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">계곡과 바다, 한라산을 모두 조망하는 <em>오아시스 디럭스</em>에서 기운을 재충전하고 차분한 휴식을 만끽해보세요.<br>
			숲을 맴도는 촉촉한 공기와 상쾌하게 차가운 늦은 밤의 미풍까지…</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/uploadStorage/roomGrade/${suite.image1}" alt="Generic placeholder image">
        </div>
      </div>
		<br/><br/><br/>
      <hr class="featurette-divider">
      
      <div class="row featurette" id="suiteFamilyGoDetail">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/uploadStorage/roomGrade/${suiteFamilly.image1}" alt="Generic placeholder image">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">Suite Familly ... <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">계곡과 바다, 한라산을 모두 조망하는 <em>오아시스 디럭스</em>에서 기운을 재충전하고 차분한 휴식을 만끽해보세요.<br>
			숲을 맴도는 촉촉한 공기와 상쾌하게 차가운 늦은 밤의 미풍까지…</p>
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->
	</div>
	</body>
</html>