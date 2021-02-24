<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeVO noticeVO = new NoticeVO();
%>
<%
	noticeVO = (NoticeVO) request.getAttribute("result");
%>
<!--  세션에서 로그인 정보 갖고 옴 -->
<%
	HttpSession httpSession = request.getSession(true);
%>
<%
	String memId = (String) httpSession.getAttribute("memId");
%>
<%
	String memPass = (String) httpSession.getAttribute("memPass");
%>
<% String noticeContent = noticeVO.getNoticeContent().replaceAll(System.lineSeparator(), "<br>"); %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<title>Easy하게 요리하자 - EzCooQ</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/mainPage.js?v=1"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="${pageContext.request.contextPath}/js/notice.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("admin" == "<%=memId%>"){
		$("#insertNoticeBtn").attr("disabled", false);
	}else{
		$("#insertNoticeBtn").hide();
		$("#chkDelete").hide();
		$("#chkUpdate").hide();
	}
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
					<form id ="searchForm" class="form-inline"  action="<%=request.getContextPath()%>/search" method="post">
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
	

	<div class="content-section">
		<div class="container">
			<div class="row">
				<form method="post" action="insertQna" id="inputForm">
						<div>
							<h2 style="text-align: left; padding-left: 20px;">공지사항</h2>
						</div><hr>
						<div style="margin-top: 25px; border-top: 2px solid black; border-bottom: 1px solid black;">
							<h4 style = "text-align : left; padding-left : 23px;">
								<%=noticeVO.getNoticeTitle()%>
								<span style="float: right; padding-right: 70px;">
								<%=noticeVO.getNoticeDate()%>&nbsp;&nbsp; |&nbsp;&nbsp; 관리자
								</span>
							</h4>
							<input type="hidden" name="noticeNo" value=<%=noticeVO.getNoticeNo()%>>
						</div>
						<div style="margin-top : 40px; size: 700px;">
							<h4 style="padding-left: 34px"><%=noticeContent%></h4>
							<hr>
						</div>
					<div style="float: right;">
						<button type="button" class="btn btn-warning" 
							onclick="location.href='<%=request.getContextPath()%>/noticeMain'">목록</button>
							
							<%if("admin".equals(memId)){ %>
								<button type="button" class="btn btn-warning" id="chkUpdate"
									onclick="location.href='<%=request.getContextPath()%>/updateNotice?noticeNo=<%=noticeVO.getNoticeNo()%>'">수정</button>
								<button id="chkDelete" type="button" class="btn btn-warning" id="chkDelete"
									onclick="location.href='<%=request.getContextPath()%>/deleteNotice?noticeNo=<%=noticeVO.getNoticeNo()%>'">삭제</button>
							<%} %>
					</div>
					<script type="text/javascript">
						$("#chkDelete").click(function() {
							alert("삭제되었습니다.");
						})
					</script>
				</form>
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
	<script src="${pageContext.request.contextPath}/js/jquery.easing-1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.6.2.min.js"></script>
</body>
</html>