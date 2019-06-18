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
    	<link href="/resources/include/css/footer.css" rel="stylesheet">
    	
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
                    <li><a href=''> 사이트 맵 </a></li>
                </ul>
                <h1 class="text-center">사이트 맵</h1>
    	</div>
    	<br/><br/><br/><br/><br/>
	<div id="content" class="content content-suite wrap_sitemap">
		<div class="sitemap_inner">
            <ul>
                <li>
                    <p>호텔소개</p>
                    <ul>
                        <li><a href="/hotelInfo/aboutUs">소개</a></li>
                        <li><a href="/hotelInfo/location">오시는 길</a></li>
                        <li><a href="/hotelInfo/trevelGuide">여행 가이드</a></li>
                        <li><a href="/">공지사항</a></li>
                    </ul>
                </li>
                <li>
                    <p>객실</p>
                    <ul>
                        <li><a href="/roomGrade/showRooms">객실</a></li>
                        <li>
                            <p>룸 & 스위트</p>
                            <ul>
                                <li><a href="/roomGrade/showDeluxe">디럭스</a></li>
                                <li><a href="/roomGrade/showDeluxeDubble">디럭스 트윈</a></li>
                                <li><a href="/roomGrade/showSuite">스위트</a></li>
                                <li><a href="/roomGrade/showSuiteFamilly">스위트 패밀리</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <p>예약</p>
                    <ul>
                        <li><a href="/client/booking/booking">예약하기</a></li>
                        <li><a href="/client/booking/booking">예약조회</a></li>
                    </ul>
                </li>
                <li class="last">
                    <p>부대시설</p>
                    <ul>
                        <li><a href="/hotelInfo/fitnessClub">더 플라자휘트니스클럽</a></li>
                        <li><a href="/hotelInfo/spaClub">더벨 스파, 더 플라자점</a></li>
                        <li><a href="/hotelInfo/swimmingPool">지스텀</a></li>
                    </ul>
                </li>
                <li>
                    <p>멤버십</p>
                    <ul>
                        <li>
                            <p>멤버십</p>
                        </li>
                    </ul>
                </li>
                <li class="last">
                    <p>온라인 컨시어지</p>
                    <ul>
                        <li><a href="/hotelInfo/floorGuide">층별 안내</a></li>
                        <li><a href="/">자주하는 질문</a></li>
                        <li><a href="/">문의하기</a></li>
                        <li><a href="/review/reviewList">후기</a></li>
                    </ul>
                </li>
            </ul>

        </div>
		
		
	</div>
	</body>
</html>