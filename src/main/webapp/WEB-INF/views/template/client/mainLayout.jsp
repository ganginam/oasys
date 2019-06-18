<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/images/icon.png">

    <title><tiles:getAsString name="title"/></title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <!-- <link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet"> -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- Custom styles for this template -->
    <link href="/resources/include/dist/css/carousel.css" rel="stylesheet">
  </head>

  <body>
  
  	<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <tiles:insertAttribute name="header" />
    </nav>

    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="/resources/images/hotelImages/bg_360.jpg" alt="First slide" >
          <div class="container">
          </div>
        </div>
        <div class="item">
          <img src="/resources/images/hotelImages/tit_bg_service.jpg" alt="Second slide">
          <div class="container">
          </div>
        </div>
        <div class="item">
          <img src="/resources/images/hotelImages/tit_bg_logo.jpg" alt="Third slide">
          <div class="container">
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="/resources/images/hotelImages/home/thumb_deluxe.jpg" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>Deluxe</h2>
          <p>"디럭스 룸에서 보이는 이 특별한 조망은 마치 도시가 이 객실을 위해 조경을 한 것 같은 느낌을 들게 할 것입니다."</p>
          <p><a class="btn btn-default" href="/roomGrade/showDeluxe" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="/resources/images/hotelImages/home/thumb_premier_suite.jpg" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>Deluxe Premium</h2>
          <p>"침실과 거실 공간이 분리된 디럭스 프리미엄은 비즈니스와 휴식이라는 두가지 키워드의 조합을 가장 잘보여주는 객실입니다."</p>
          <p><a class="btn btn-default" href="/roomGrade/showDeluxeDouble" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="/resources/images/hotelImages/home/thumb_royal_plaza_suite.jpg" alt="Generic placeholder image" style="width: 140px; height: 140px;">
          <h2>Suite</h2>
          <p>"세상 단 하나의 스위트룸, 그만큼 특별하고 설레고 화려한 단어가 있을까요. 누구나 동경하는 오아시스 스위트가 갖는 특별함입니다."</p>
          <p><a class="btn btn-default" href="/roomGrade/showSuite" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">
      <br/><br/>
      <br/><br/>
	
      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">무더운 여름 <span class="text-muted">오아시스와 함께</span></h2>
          <p class="lead">한강이 한눈에 펼쳐지는 수영장과 유니크한 인테리어의 객실에서 스타일리시한 여름 휴가를 즐겨보세요!</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/resources/images/hotelImages/concierge/f_guide_img3.jpg" alt="Generic placeholder image">
        </div>
      </div>
      <br/><br/>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/resources/images/hotelImages/home/image01.jpg" alt="Generic placeholder image">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">여름을 부탁해! <span class="text-muted">보양식으로 기운찬 하루</span></h2>
          <p class="lead">버라이어티 다이닝에서 여름 제철 식재료를 활용한 보양 메뉴를 선보입니다. 기대 그 이상의 맛을 경험해보시기 바랍니다.</p>
        </div>
      </div>
      <br/><br/>
      
      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">오아시스호텔 근처에서 다양한 경험을 즐기세요!</h2>
          <p class="lead">여의도 공원과 한강공원, 물빛광장, 유람선 선착장, IFC쇼핑몰, 63빌딩 등을 만나보세요.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="/resources/images/hotelImages/tourGuide/tour_img_02_02.jpg" alt="Generic placeholder image">
        </div>
      </div>
      <br/><br/><br/><br/>
      <br/><br/><br/><br/>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->

 	 </div><!-- /.container -->

    <footer class="footer">
      <tiles:insertAttribute name="footer" />
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
