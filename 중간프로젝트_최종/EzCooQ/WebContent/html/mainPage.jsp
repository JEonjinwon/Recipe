<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  세션에서 로그인 정보 갖고 옴 -->
<%
	HttpSession httpSession = request.getSession(true);
	String memId = (String) httpSession.getAttribute("memId");
	String memPass = (String) httpSession.getAttribute("memPass");
	request.setCharacterEncoding("UTF-8");
	String cook = request.getContextPath();
	String getPath = request.getContextPath(); 
%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<title>Easy하게 요리하자 - EzCooQ</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- JS & CSS-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-misc.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Slide.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/mainPage.js?v=1"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	getHighRank();
});

</script>
</head>
<body>
	<header class="site-header">
		<div class="top-header">
			<div class="container">
				<div class="row align-right">
				<%if(memId != null){%>
					<span class="idSpan right-padding"><a href="#" onclick="payStart('<%=memId%>', 10000)">포인트 충전</a></span>
					<span class="idSpan right-padding"><a href="#" onclick="chatPopup()">관리자 1:1 문의</a></span>
					<span class="idSpan"><%=memId%> 회원님 안녕하세요!</span>
				<%}else{%>
					<span class="idSpan">로그인을 해주세요.</span>
				<%}%>
				</div>
				<!-- /.row -->
			</div>
			
			<!-- /.container -->
		</div>
		<!-- /.top-header -->
		<div class="main-header">
			<div class="container">
				<div class="row">
						<h1 style="float: left; padding-left:170px;">
							<a class="inline-block" href="/EzCooQ/html/mainPage.jsp" style="color: orange; font-weight: bold; margin-right: 50px;">EzCooQ</a>
						</h1>
					<form id ="searchForm" class="form-inline"  action="<%=getPath%>/search" method="post">
						<input type="text" id="searchText"  name="searchText">
						<input type="button" value="검색 " id="searchBtn" onclick="search()" class="btn btn-warning">
					</form>	
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.main-header -->
		<div class="main-nav">
			<div class="container">
				<div class="row">
					<div class="list-menu leftFloat">
						<ul>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"> Recipe <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li>
										<a href="<%=getPath%>/officalBoardServlet">공식 레시피</a>
									</li>
									<li>
										<a href="<%=getPath%>/ViewBoardAll">유저 레시피</a>
								 	</li>
									<li>
										<a href="<%=getPath%>/SelectPayBoardServlet">유료 레시피</a>
								 	</li>
							<%if(memId!=null){ %>
									<li>
										<a href="#" onclick="BuyPage()">구매 레시피</a>
								 	</li>
							<%} %>	 	
								</ul>
							<li><a href="<%=getPath%>/html/product-detail.jsp">미니게임</a></li>
							<li><a href="<%=getPath%>/noticeMain">공지사항</a></li>
							<li><a href="<%=getPath%>/qnaMain">Q&A</a></li>
						</ul>
					</div>
					<div class="list-menu rightFloat">
						<ul>
						<%if (memId == null) {%>
							<li><a href="#" onclick="createMember()">회원가입</a>
							<li><a href="#" onclick="login()">로그인</a> 
						<%}else if("admin".equals(memId)){%>
							<li><a href="/EzCooQ/html/manage/salesManage.jsp">관리자 페이지</a>
							<li><a href="#" onclick="logout()">로그아웃</a> 						
						<%}else { %>
							<li><a href="#" onClick="cart()">장바구니</a>
							<li><a href="/EzCooQ/html/myPage/myInfoPage.jsp">마이페이지</a>
							<li><a href="#" onclick="logout()">로그아웃</a> 
						<%}%>
						</ul>
					</div>

				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.main-nav -->
	<form id="cartForm1" action="<%=getPath%>/SearchCartServlet" method="post">
		<input type="hidden" value="<%=memId%>" name=memId>
	</form>
	<form id="cartForm2" action="<%=getPath%>/SearchBuyCartServlet" method="post">
		<input type="hidden" value="<%=memId%>" name=memId2>
	</form>
	</header>
	<!-- /.site-header -->
	
	
	
	
	
	
	
	<div class="content-section">
		<div class="container align-center">
			<div class="row">
				<div class="col-xs-12 section-title">
					<h2 class="subTitle">인기 유저 레시피 TOP5</h2>
				</div>
			</div>
			<div class="w3-display-container slideimg">
				<div class="w3-display-container mySlides">
				<a href="#">
				  <img src="<%=getPath%>/images/loading.gif" class="slideimg" id="slideImg1">
				</a>
				  <div class="w3-display-bottom w3-large w3-container slide foodTitle">
				    <span class="boldSpan" id = "slide1">로딩중...</span>
				  </div>
				</div>
				<div class="w3-display-container mySlides">
				<a href="#">
				  <img src="<%=getPath%>/images/loading.gif" class="slideimg" id="slideImg2">
				</a>
				  <div class="w3-display-bottom w3-large w3-container foodTitle">
				    <span class="boldSpan" id = "slide2">로딩중...</span>
				  </div>
				</div>
				
				<div class="w3-display-container mySlides">
				<a href="#">
				  <img src="<%=getPath%>/images/loading.gif" class="slideimg" id="slideImg3">
				</a>
				  <div class="w3-display-bottom w3-large w3-container foodTitle">
				    <span class="boldSpan" id = "slide3">로딩중...</span>
				  </div>
				</div>
				
				<div class="w3-display-container mySlides">
				<a href="#">
				  <img src="<%=getPath%>/images/loading.gif" class="slideimg" id="slideImg4">
				</a>
				  <div class="w3-display-bottom w3-large w3-container foodTitle">
				    <span class="boldSpan" id = "slide4"></span>
				  </div>
				</div>
				
				<div class="w3-display-container mySlides">
				<a href="#">
				  <img src="<%=getPath%>/images/loading.gif" class="slideimg" id="slideImg5">
				</a>
				  <div class="w3-display-bottom w3-large w3-container foodTitle">
				    <span class="boldSpan" id = "slide5"></span>
				  </div>
				</div>
				
				<button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
				<button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>
				
				</div>
				
				<script>
				var slideIndex = 1;
				showDivs(slideIndex);
				
				function plusDivs(n) {
				  showDivs(slideIndex += n);
				}
				
				function showDivs(n) {
				  var i;
				  var x = document.getElementsByClassName("mySlides");
				  if (n > x.length) {slideIndex = 1}
				  if (n < 1) {slideIndex = x.length}
				  for (i = 0; i < x.length; i++) {
				     x[i].style.display = "none";  
				  }
				  x[slideIndex-1].style.display = "block";  
				}
				</script>
		<!-- /.container -->
	</div>
	<!-- /.content-section -->
</div>


	<div class="content-section">
		<div class="container">
			<h2>Influencer</h2>
			<div class="row">
				<div class="col-xs-3">
					<div class="product-item-1">
						<div class="product-thumb">
							<a href="https://www.youtube.com/watch?v=kR77WlHRZrs"  target="_blank"> <img src="../img/mainImg1.PNG" alt="Product Title"></a>
						</div>
						<!-- /.product-thumb -->
						<div class="product-content">
					
							<h5>
								백종원
							</h5>
							<span class="tagline">백종원의 요리비책 Paik's </span>
							<p>볶음밥 정말 종류가 많죠? 오늘은 불맛 나는 달걀볶음밥입니다.
								중국 길거리 식당에서 맛보신 볶음밥 있죠? 바로 그 볶음밥입니다!</p>
						</div>
						<!-- /.product-content -->
					</div>
					<!-- /.product-item -->
				</div>
				<!-- /.col-xs-3 -->
				<div class="col-xs-5">
					<div class="product-holder">
						<a href="https://www.youtube.com/watch?v=jZXGY7W2PMY"  target="_blank">
						<div class="product-item-2">
							<div class="product-thumb">
								<img src="../img/mainImg2.PNG" alt="Product Title">
							</div>
							<!-- /.product-thumb -->
							<div class="product-content overlay">
								<h5>
									승우아빠
								</h5>
								<span class="tagline">요리유튜버 육식맨 저격용 선넘는 요리</span> 
								<p>
									오늘은 육식맨님과의 콜라보를 위한
									허브크러스트 뼈등심과 돈까스를 만들어 보았습니다</p>
							</div>
							<!-- /.product-content -->
						</div>
						</a>
						<!-- /.product-item-2 -->
						<a href="https://www.youtube.com/watch?v=Cyskqnp1j64"  target="_blank">
						<div class="product-item-2">
						
							<div class="product-thumb">
								<img src="../img/mainImg3.PNG" alt="Product Title" >
							</div>
							<!-- /.product-thumb -->
							<div class="product-content overlay">
								<h5>
								Gordon Ramsay<br>고든램지
								
								</h5>
								<span class="tagline">
									CHRISTMAS RECIPE: Christmas Beef Wellington	
									<br>								
									CHRISTMAS RECIPE : 크리스마스 비프 웰링턴	
								</span>
								<p>A Christmas take on a classic dish.
								<br>
								크리스마스는 고전적인 요리를 선보입니다.</p>
							</div>
							<!-- /.product-content -->
						</div>
						</a>
						<!-- /.product-item-2 -->
						<div class="clearfix"></div>
					</div>
					<!-- /.product-holder -->
				</div>
				<!-- /.col-xs-5 -->
				<div class="col-xs-4">
					<div class="product-item-3">
						<div class="product-thumb">
						<a href="https://www.youtube.com/watch?v=a83V_zEy0sE" target="_blank">
							<img src="../img/mainImg4.PNG" alt="Product Title"  >
							</a>
						</div>
						<!-- /.product-thumb -->
						<div class="product-content">
							<div class="row">
								<div class="col-xs-6 col-sm-6">
									<h5>
										밥 해주는 남편 _ 쿠킹누보
									</h5>
									
								</div>
								<!-- /.col-xs-6 -->
								<div class="col-xs-6 col-sm-6">
									<div class="full-row">
										<span class="tagline">집에서 만드는 간단한 소고기요리 10가지 레시피 </span> 
									</div>
								
								</div>
									<br><br><br><br>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.product-content -->
					</div>
					<!-- /.product-item-3 -->
				</div>
				<!-- /.col-xs-4 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-xs-4 col-sm-6 col-xs-12">
				<a href="https://www.youtube.com/watch?v=d0hn_8_vB2M"  target="_blank">
					<div class="product-item-4">
						<div class="product-thumb">
							<img src="../img/mainImg5.PNG" alt="Product Title">
						</div>
						<!-- /.product-thumb -->
						<div class="product-content overlay">
							<h5>
								취미로 요리하는 남자 Yonam
							</h5>
							<span class="tagline">집에서 하는 흔한 코스요리</span>
							<p>친구들과 아기가 집에 놀러왔어요!
								요리가 다 나오면 옮겨주고 촬영하느라 바로 못 먹게 하는게 항상 마음에 걸렸는데
								이제 바 테이블이 생겨서 따뜻한 음식을 바로 입에 넣어줄 수 있게 되었어요.
								신난다.</p>
						</div>
						<!-- /.product-content -->
					</div>
					<!-- /.product-item-4 -->
					</a>
				</div>
				<!-- /.col-xs-4 -->
				<div class="col-xs-4 col-sm-6 col-xs-12">
					<a href="https://www.youtube.com/watch?v=DTfuuwfyk5o" target="_blank">
					<div class="product-item-4">
						<div class="product-thumb">
							<img src="../img/mainImg6.PNG" alt="Product Title">
						</div>
						<!-- /.product-thumb -->
						<div class="product-content overlay">
							<h5>
							하루한끼 one meal a day
							</h5>
							<span class="tagline">수플레 오믈렛 :: 퐁실퐁실 :: Souffle Omelette #93</span>
							<p>재료
									- 계란2개
									- 설탕 반스푼
									- 소금 한꼬집
									
									만들기
									1. 계란 흰자와 노른자를 분리한다
									2. 노른자엔 소금 한꼬집 넣고 섞어둔다
									3. 흰자는 거품기로 거품이 날때까지 젓기
									4. 거품나면 설탕 반스푼 넣고 쫀쫀해질때까지 젓기
									5. 흰자와 노른자를 살살 섞어준다(거품이 꺼지지 않게 아주 살살)
									6. 팬에 버터 또는 식용유를 바르고 계란반죽을 넣는다(약불)
									7. 뚜껑 닫고 2~3분간 익히기 (약불 잊지마세요)
									8. 반으로 접어 앞뒤로 익힌다
									9. 메이플시럽등을 곁들여 먹는다</p>
						</div>
						<!-- /.product-content -->
					</div>
					<!-- /.product-item-4 -->
					</a>
				</div>
				<!-- /.col-xs-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.content-section -->

	<footer class="bite-footer">
		<div class="bottom-footer">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 text-center">
						<span>Copyright &copy; 2020 <a href="#">EzCooQ</a>
						</span>
						<p>김선준 전진원 길영주 김성준 이선엽</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	
	<script src="${pageContext.request.contextPath }/js/vendor/jquery-1.10.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.easing-1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.6.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/Slide.js"></script>
</body>
</html>