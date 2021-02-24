<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	HttpSession httpSession = request.getSession(true);%>
<%	String memId = (String) httpSession.getAttribute("memId");%>
<%	String memPass = (String) httpSession.getAttribute("memPass");%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<!-- 
Kool Store Template
http://www.templatemo.com/preview/templatemo_428_kool_store
-->
<meta charset="utf-8">
<title>EzCooQ</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800"
	rel="stylesheet">
<!-- JavaScript JS -->
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/normalize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/templatemo-misc.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/templatemo-style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/Slide.css">


<script src="${pageContext.request.contextPath }/js/vendor/modernizr-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath }/js/Slide.js"></script>

<script src="${pageContext.request.contextPath }/js/mainPage.js"></script>
<!-- <script scr="../js/board.js"></script> -->
<script type="text/javascript">

</script>
<style type="text/css">
div.awesomeRating {
	font-size: 4em;
	padding: 1em 0em;
	text-align: center;
}

div.awesomeRatingValue {
	font-size: 2em;
	padding: 1em 0em;
	text-align: center;
}
.rating-star{color:lightgrey;cursor:pointer}
.rating-star.fa-star{color:#FDD05B}.rating-star-hover{opacity:.6}
.rating-star-fractional{position:absolute;overflow:hidden;z-index:2}
.site-footer{
	position: relative;
}
</style>
</head>
<body>
		<header class="site-header">
		<script type="text/javascript">
function cart() {
	$("#cartForm1").submit();
}
function BuyPage() {
	$("#cartForm2").submit();
}

</script>
		<div class="top-header">
			<div class="container">
				<div class="row align-right">
				<button type="button" class="btn btn-warning" onclick="chating()">1:1채팅</button>
				<%if(memId != null){%>
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
					<div class="col-xs-4 col-sm-6 col-xs-8">
						<div class="logo">
							<h1>
								<a href="/EzCooQ/html/mainPage.jsp">EzCooQ</a>
							</h1>
						</div>
						<!-- /.logo -->
					</div>
					<!-- /.col-xs-4 -->
					<div class="col-xs-8 col-sm-6 col-xs-4"></div>
					<!-- /.col-xs-8 -->
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
										<a href="<%=request.getContextPath()%>/officalBoardServlet">공식 레시피</a>
									</li>
									<li>
										<a href="<%=request.getContextPath()%>/ViewBoardAll">유저 레시피</a>
								 	</li>
									<li>
										<a href="<%=request.getContextPath()%>/SelectPayBoardServlet">유료 레시피</a>
								 	</li>
							<%if(memId!=null){ %>
									<li>
										<a href="#" onclick="BuyPage()">구매 레시피</a>
								 	</li>
							<%} %>	 	
								</ul>
							<li><a href="<%=request.getContextPath()%>/html/product-detail.jsp">미니게임</a></li>
							<li><a href="<%=request.getContextPath()%>/noticeMain">공지사항</a></li>
							<li><a href="<%=request.getContextPath()%>/qnaMain">Q&A</a></li>
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
	</header>
	
	
	<form action="/EzCooQ/InsertRecipe" method="post">
		<div class="content-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 section-title">
						<h2>레시피 등록</h2>
					</div>
					<!-- /.section -->
				</div>
				<!-- /.row -->
				<div class="row">
					<label for="title" style="margin-left: 15px;"> 제목 : </label> <input
						type="text" class="form-control" name="boardTitle"
						style="width: 200px; display: inline;"> <input
						type="button" calss="form-control"
						onclick="location.href='index3.html'" value="목록"
						style="float: right; display: inline;"> <br>
					<br>
				</div class="row">
				<div style="max-width: 100%; max-height: 100%; display: flex">
					<label for="content">내용 : </label>
					<textarea rows="50" cols="12" class="form-control"
						name="boardContent"
						style="max-width: 90%; max-height: 90%; display: inline"></textarea>

				</div><br>
				작성자 : <input type="text" name = "memId">
				<br>분류 : <input type="text" name = "foodId">
				<br>카테고리 : <input type="text" name = "recipeId">
				
				<br> <input type="submit" class="form-control" onclick="insert()" value="등록" style="width: 50px; margin: 0 auto;">
					<input type="hidden" name="action" value="userRecipe">
				<br> 

				</div>

				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.content-section -->
		<br>
	</form>




	<footer class="site-footer">
		<div class="our-partner">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="customNavigation">
							<a class="btn prev"><i class="fa fa-angle-left"></i></a> <a
								class="btn next"><i class="fa fa-angle-right"></i></a>
						</div>
						<div id="owl-demo" class="owl-carousel">
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
						</div>
						<!-- /#owl-demo -->
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.our-partner -->

		<!-- /.main-footer -->
		<div class="bottom-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<span>Copyright &copy; 2020 <a href="#">EzCooQ</a>
						</span>
						<p>김선준 전진원 길영주 김성준 이선엽</p>
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.bottom-footer -->
	</footer>
	<!-- /.site-footer -->


	<script src="js/vendor/jquery-1.10.1.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')
	</script>
	<script src="js/jquery.easing-1.3.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>


</body>
</html>