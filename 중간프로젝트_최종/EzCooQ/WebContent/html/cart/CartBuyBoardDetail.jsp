<%@page import="kr.or.ddit.comment_board.vo.CommentBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	BoardVO boardVO = (BoardVO) request.getAttribute("bv");
%>
<%
	HttpSession httpSession = request.getSession(true);
%>
<%
	String memId = (String) httpSession.getAttribute("memId");
%>
<%
	String memPass = (String) httpSession.getAttribute("memPass");
%>
<%
	CommentBoardVO comVO = (CommentBoardVO) request.getAttribute("comVO");
%>
<%
	String comContent = (String) request.getAttribute("comContent");
%>
<%
	String comStar = (String) request.getAttribute("comStar");
	String ct = boardVO.getBoardContent();
	ct = ct.replaceAll("\r\n", "<br><br>");
%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<title>EzCooQ - 구매한 레시피 상세</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width">


<script src="${pageContext.request.contextPath }/js/PDF/html2canvas.js"></script>
<script src="${pageContext.request.contextPath }/js/PDF/jspdf.min.js"></script>
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

<style>
.rating-star {
	color: lightgrey;
	cursor: pointer
}

.rating-star.fa-star {
	color: #FDD05B
}

.rating-star-hover {
	opacity: .6
}

.rating-star-fractional {
	position: absolute;
	overflow: hidden;
	z-index: 2
}

.conmment-view {
	width: 66%;
	left: 34%;
	margin-left: auto;
}

th, td {
	text-align: center;
}

.input-group {
	left: 34%;
}

.awesomeRating {
	left: 34%;
}

img.ribbon {
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	border: 0;
	cursor: pointer;
}

#insCmtFrm1 {
	padding-bottom: 200px;
}

.modal-content {
	width: 500px; height 100px;
	margin-top: 500px;
	margin-left: 100px;
	position: absolute;
}

.modal-body {
	height: 230px;
}

table {
	text-align: center;
	margin: auto;
	font-size: x-large;
	font-weight: bold;
	margin-bottom: 20px;
}

td {
	padding-bottom: 50px;
	width: 30%;
}

.tdContent {
	font-size: small;
}
</style>

<script>
$(document).ready(function() {
	$('#savePdf').click(function() { // pdf저장 button id
		
	    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
		
	    // 캔버스를 이미지로 변환
	    var imgData = canvas.toDataURL('image/png');
		     
	    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
	    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    var imgHeight = canvas.height * imgWidth / canvas.width;
	    var heightLeft = imgHeight;
	    var margin = 10; // 출력 페이지 여백설정
	    var doc = new jsPDF('p', 'mm');
	    var position = 0;
	       
	    // 첫 페이지 출력
	    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	    heightLeft -= pageHeight;
	         
	    // 한 페이지 이상일 경우 루프 돌면서 출력
	    while (heightLeft >= 20) {
	        position = heightLeft - imgHeight;
	        doc.addPage();
	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	        heightLeft -= pageHeight;
	    }
	 
	    // 파일 저장
	    doc.save('EzCooQ_<%=boardVO.getBoardTitle()%>.pdf');

		  
	});

	});
	
	
})



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
	
	
	<button type="button" class="btn btn-warning" id="savePdf"
		style="margin-left: 80%; margin-top: 20px;">PDF 저장</button>
		<div id="pdfDiv">
					<table>
						<tr>
							<td class="tdEven">No : <%=boardVO.getBoardNo()%></td>
						</tr>
						<tr>
							<td class="tdEven" style="color: red;"><%=boardVO.getBoardTitle()%></td>
						</tr>
						<tr>
							<td class="tdEven"><img alt=""
								src="<%=boardVO.getBoardImg()%>"
								style="width: 400px; height: 250px;"></td>
						</tr>
						<tr>
							<td class="tdEven">날짜 : <%=boardVO.getBoardDate().substring(0, 10)%></td>
						</tr>
						<tr>
							<td class="tdContent"><%=ct%></td>
						</tr>
					</table>
				</div>
	

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
	<script>
		window.jQuery || document.write('<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.1.min.js"></script>')
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