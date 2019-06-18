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
          <h2 class="featurette-heading"><span class="text-muted"> Deluxe</span></h2>
          <p class="lead"><em>디럭스</em>룸에서 보이는 이 특별한 조망은 마치 도시가 이 객실을<br>
			위해 조경을 한 것 같은 느낌을 들게 할 것입니다.</p>
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

          <h2 class="featurette-heading"><span class="text-muted">Deluxe Premium </span></h2>
          <p class="lead"><em>디럭스 프리미엄</em>은 비즈니스와 휴식이라는 두 가지 키워드 조합을 <br>
			가장 잘 보여주는 객실입니다. 가장 합리적이면서도 스타일리시한 객실로 기대 그 이상의 경험을 즐겨보세요.</p>
        </div>
      </div>
		<br/><br/><br/>
      <hr class="featurette-divider">

      <div class="row featurette" id="suiteGoDetail">
        <div class="col-md-7">

          <h2 class="featurette-heading"><span class="text-muted">Suite </span></h2>
          <p class="lead"><em>스위트</em>객실 벽면의 반 이상이 창으로 된 훌륭한 구조의 이 객실은 <br>
			프리즘처럼 반짝이는 따뜻하고 아름다운 객실입니다.</p>

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
          <h2 class="featurette-heading"> <span class="text-muted">Loyal Suite</span></h2>
          <p class="lead">최고의 귀빈만을 위한 <em>로열 스위트</em>는 오아시스의 전통적인 디자인 컨셉을 가지고 있는 최고급 객실입니다.<br>
			촉촉한 공기와 상쾌하게 차가운 늦은 밤의 미풍까지…</p>
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->
	</div>
	</body>
</html>