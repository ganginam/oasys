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
    	<link href="/resources/include/css/about.css" rel="stylesheet">
    	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
				
		<style type="text/css">
			
			
			
		</style>
		<script type="text/javascript">

		</script>
	</head>
	<body>
		<div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href='/hotelInfo/aboutUs'> The Oasis </a></li>
                    <li> > </li>
                    <li class="current"><a href='/hotelInfo/location'>오시는 길</a></li>
                </ul>
                <h1 class="text-center">오시는 길</h1>
                <br/>
                <h5 class="text-center">오아시스로 오시는 길을 소개합니다.</h5>
    	</div>
	<div id="contents" class="content content-suite">
		<div class="about_content contact">
			<div class="section_contact">
	            <div class="map_area">
	                <div id="naver_map"></div>
	                <div id="google_map"></div>
	                <img src="/resources/images/hotelImages/contact_map.png" alt="더 플라자로 오시는 길"/>
	            </div>
	
	            <div class="contact_list">
	                <ul>
	                    <li>
	                        <div class="tit">주소 &amp; 연락처</div>
	                        <div class="desc">
	                            <div class="item multiline">
	                                <div class="ico"><img src="/resources/images/hotelImages/ico_addr.png" alt=""/></div>
	                                <div class="text"><em>주소</em>서울특별시 영등포구 여의도동 21-1 (우: 04525)</div>
	                            </div>
	                            <div class="item multiline">
	                                <div class="ico"><img src="/resources/images/hotelImages/ico_phone.png" alt=""/></div>
	                                <div class="text"><em>전화</em>02.771.2200</div>
	                            </div>
	                            <div class="item multiline">
	                                <div class="ico"><img src="/resources/images/hotelImages/ico_fax.png" alt=""/></div>
	                                <div class="text"><em>팩스</em>02.755.8897</div>
	                            </div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="tit">교통편</div>
	                        <div class="desc">
	                            <div class="item">
	                                <div class="ico"><img src="/resources/images/hotelImages/ico_metro.png" alt=""/></div>
	                                <div class="text"><em>지하철 이용시</em>여의나루역(5호선)에서 하차, 1번 출구에서 도보 1-2분 거리</div>
	                            </div>
	                            <div class="item">
	                                <div class="ico"><img src="/resources/images/hotelImages/ico_bus.png" alt=""/></div>
	                                <div class="text"><em>버스 이용시</em>여의나루역 앞 정류소 하차</div>
	                            </div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="tit">공항에서<br>오실 때</div>
	                        <div class="desc">
	                            <div class="item">
	                                <div class="ico"><img src="/resources/images/hotelImages/ico_airport.png" alt=""/></div>
	                                <div class="text">
	                                    <em>인천국제공항</em>
	                                    <div class="dl_wrap">
	                                        <dl>
	                                            <dt>KAL 리무진<br>(6701번)</dt>
	                                            <dd>요금: 16,000원(편도)<br>
	                                                소요시간: 60분<br>
	                                                운행시간: 04:50-22:50 (공항 → 호텔) / 04:50-18:35 (호텔 → 공항)</dd>
	                                        </dl>
	                                        <dl>
	                                            <dt>지하철</dt>
	                                            <dd>노선: 공항철도 탑승 → 서울역 5호선 환승 → 여의나루역 하차<br>
	                                                소요시간: 약 55분</dd>
	                                        </dl>
	                                        <dl>
	                                            <dt>택시</dt>
	                                            <dd>요금: 70,000원(일반) / 90,000원(모범)<br>
	                                                소요시간: 50분</dd>
	                                        </dl>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="item">
	                                <div class="ico"><img src="/resources/images/hotelImages/ico_airport.png" alt=""/></div>
	                                <div class="text">
	                                    <em>김포국제공항</em>
	                                    <div class="dl_wrap">
	                                        <dl>
	                                            <dt>공항 리무진<br>(6021번)</dt>
	                                            <dd>요금: 7,000원(편도)<br>
	                                                소요시간: 약 35분 *여의나루역 앞에서 하차<br>
	                                                운행시간: 05:00-23:10 (공항 → 여의나루역) / 05:45-20:40 (여의나루역 → 공항)</dd>
	                                        </dl>
	                                        <dl>
	                                            <dt>지하철</dt>
	                                            <dd>노선: 공항철도 탑승 → 서울역 5호선 환승 → 여의나루역 하차<br>
	                                                소요시간: 약 20분</dd>
	                                        </dl>
	                                        <dl>
	                                            <dt>택시</dt>
	                                            <dd>요금: 30,000원(일반) / 50,000원(모범)<br>
	                                                소요시간: 약 30분</dd>
	                                        </dl>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>
		</div>
	</div>
	</body>
</html>