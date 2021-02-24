<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	HttpSession httpSession = request.getSession(true);
	String memId = (String) httpSession.getAttribute("memId");
	String memPass = (String) httpSession.getAttribute("memPass");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EzCooQ - 마이페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- JS & CSS-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-misc.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Slide.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/mainPage.js?v=1"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/myPage.css">
<script src="${pageContext.request.contextPath }/js/myPage.js"></script>

<script type="text/javascript">
	$(function() {
		selectMember('<%=memId%>');		
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
					<form id ="searchForm" class="form-inline"  action="<%=request.getContextPath()%>/search" method="post" style="margin-top: 18px;">
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
	<form id="cartForm1" action="<%=request.getContextPath()%>/SearchCartServlet" method="post">
		<input type="hidden" value="<%=memId%>" name=memId>
	</form>
		
		
	<form id="cartForm2" action="<%=request.getContextPath()%>/SearchBuyCartServlet" method="post">
		<input type="hidden" value="<%=memId%>" name=memId2>
	</form>
	</header>
	<!-- /.site-header -->

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h2>마이페이지</h2>
				<ul class="nav nav-pills nav-stacked">
					<li class="profile-menu active" id="searchMyInfo">
					<a href="/EzCooQ/html/myPage/myInfoPage.jsp">내 정보 조회</a></li>
					<li class="profile-menu">
					<a href="/EzCooQ/html/myPage/myBoardPage.jsp">내 작성글</a></li>
					<li class="profile-menu">
					<a href="/EzCooQ/html/myPage/myCommentPage.jsp">내 댓글</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9">
				<hr>
				<h2>내 정보 조회</h2>
				<div class="card">
					<div class="card-body">
						<div class="d-flex flex-column align-items-center text-center">
							<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
								alt="Admin" class="rounded-circle" width="150">
							<div class="mt-3">
								<p id="#memNameP"></p>
								<p class="text-secondary mb-1">
									<span id="memId"></span>
								</p>
								<button type="button" class="btn btn-primary" onclick="passCheckPopUp('updateMember')">개인정보 수정</button>
								<button type="button" class="btn btn-outline-primary" onclick="passCheckPopUp('deleteMember')">회원탈퇴</button>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<br>
				<div class="card mb-3">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">이름</h6>
							</div>
							<div class="col-sm-9 text-secondary" id="memNameDiv"></div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">Email</h6>
							</div>
							<div class="col-sm-9 text-secondary" id="memMail"></div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">휴대폰번호</h6>
							</div>
							<div class="col-sm-9 text-secondary" id="memTel"></div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">생일</h6>
							</div>
							<div class="col-sm-9 text-secondary" id="memBir"></div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">성별</h6>
							</div>
							<div class="col-sm-9 text-secondary" id="memGender"></div>
						</div>
					</div>
				</div>
						<hr>
				<div class="row gutters-sm">
					<div class="col-sm-6 mb-3">
						<div class="card h-100">
							<div class="card-body">
								<h6 class="d-flex align-items-center mb-3">
									<i class="material-icons text-info mr-2">포인트 : </i> 
									<i class="material-icons text-info mr-2" id="memPoint"></i> 
									<br>
									<i class="material-icons text-info mr-2">최근 획득 경로 : </i>
									<i class="material-icons text-info mr-2" id="memLastPoint"></i>
								</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="card h-100">
							<div class="card-body">
								<h6 class="d-flex align-items-center mb-3">
									<i class="material-icons text-info mr-2">등급 : </i>
									<i class="material-icons text-info mr-2" id="memGrade"></i>
								</h6>
								<small>경험치</small>
								<div class="progress mb-3" style="height: 5px">
									<div id="expBar" class="progress-bar bg-primary" role="progressbar"
										style="width: 1%" aria-valuenow="80" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>
	<footer class="bite-footer">
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
	
	<script src="${pageContext.request.contextPath }/js/vendor/jquery-1.10.1.min.js"></script>
	<script>
		window.jQuery || document.write('<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.1.min.js"><\/script>')
	</script>
	<script src="${pageContext.request.contextPath}/js/jquery.easing-1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.6.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/Slide.js"></script>
</body>
</html>