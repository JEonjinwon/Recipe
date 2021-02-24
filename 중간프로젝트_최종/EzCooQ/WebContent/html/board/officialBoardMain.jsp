<%@page import="java.util.List"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="kr.or.ddit.board.vo.PagingVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 	PagingVO pagingVO = (PagingVO) request.getAttribute("pagingVO");
	NodeList itemNodeList = (NodeList) request.getAttribute("itemNodeList");
	String lName = ""; //이름 
	String lIngredients = ""; //재료
	String Classification = "";//분류
	String Classification2 = "";//분류
	String img = "";//사진
	String img2 = "";//레시피사진
	String cookWay = "";//방법
	String img3 = ""; //레시피 방법 이미지 출력하는 것
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EzCooQ - 공식레시피</title>
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

<style type="text/css">
body {
	font-family: "Open Sans", Arial, sans-serif;
}

h1 {
	color: #cd5c5c;
}

.spanText {
	color: #cd5c5c;
	font-size: 12px;
}

.content-section {
	text-align: center;
}

.site-footer {
	position: relative;
}

.official {
	float: left;
	padding-left: 20px;
}

.divMain {
	width: 1024px;
	margin: auto;
}

.spanDiv {
	padding-bottom: 70px;
	width: 100%;
	text-align: center;
}
</style>
<%
	
%>

<script type="text/javascript">
	function Classification2() {

		var CfRadio = $("input:radio[name=Classification]:checked").val();

		for (var i = 0; i < 100; i++) {
			var ClassificationDivVal = $("#ClassificationDiv" + i)
					.attr("class");
			$("#ClassificationDiv" + i).css("display","none");

			if (CfRadio == ClassificationDivVal) {

				$("." + ClassificationDivVal).css("display","block");
			} else if (CfRadio == "전체") {

				$("#ClassificationDiv" + i).css("display","block");
			}
		}
		
	}
	
	
	function lNameValue(i) {
		
		var lNameStrongVal=	$("#lName"+i).attr("value");
		console.log(lNameStrongVal);
		$("#lNameHidden").val(lNameStrongVal);
		$("#form").submit();
	}
	
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
		<div class="row">

			<form id="form" action="/EzCooQ/officalBoardDetailServelt"
				method="post">
				<input type="hidden" id="lNameHidden" name="lNameHidden">

				<h1>
					<strong>분류</strong>
				</h1>

				<div class="btn-group btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-danger"> <input type="radio"
						name="Classification" id="jb-radio-1" value="전체" checked="checked">
						전체조회
					</label> <label class="btn btn-danger"> <input type="radio"
						name="Classification" id="jb-radio-2" value="밥"> 밥
					</label> <label class="btn btn-danger"> <input type="radio"
						name="Classification" id="jb-radio-3" value="국"> 국&찌개
					</label> <label class="btn btn-danger"> <input type="radio"
						name="Classification" id="jb-radio-4" value="반찬"> 반찬
					</label> <label class="btn btn-danger"> <input type="radio"
						name="Classification" id="jb-radio-5" value="일품"> 일품
					</label> <label class="btn btn-danger"> <input type="radio"
						name="Classification" id="jb-radio-6" value="후식"> 후식
					</label>
				</div>
				<br> <br>
				<div class="container">
					<button type="button" class="btn btn-danger btn-block"
						onclick="Classification2()">찾기</button>
				</div>

				<br> <br> <br>
				<div class="divMain">
					<%
						String MANUAL = "MANUAL";
						String MANUALIMG = "MANUAL_IMG";
						for (int i = 0; i < itemNodeList.getLength(); i++) {
					%>
					<div class=official>
						<%
							String ClassificationDiv = "ClassificationDiv";
								String lNameStrong = "lName";
								Node itemNode = itemNodeList.item(i);
								Element element = (Element) itemNode;
								lName = element.getElementsByTagName("RCP_NM").item(0).getTextContent();
								lIngredients = element.getElementsByTagName("RCP_PARTS_DTLS").item(0).getTextContent();
								if ("국&찌개".equals(element.getElementsByTagName("RCP_PAT2").item(0).getTextContent())) {
									String[] cf = "국&찌개".split("&");
									Classification = cf[0];
								} else {
									Classification = element.getElementsByTagName("RCP_PAT2").item(0).getTextContent();
								}
								Classification2 = element.getElementsByTagName("RCP_PAT2").item(0).getTextContent();
								img = element.getElementsByTagName("ATT_FILE_NO_MK").item(0).getTextContent();
								ClassificationDiv += i;
								lNameStrong += i;
						%>
						<div id="<%=ClassificationDiv%>" value="<%=Classification2%>"
							class="<%=Classification%>">

							<a href="#"> <input type="image" src="<%=img%>"
								onclick="lNameValue(<%=i%>)"
								style="width: 280px; height: 300px;"><br>
								<div class="spanDiv">
									<span class="spanText"> <br> <strong
										id="<%=lNameStrong%>" onclick="lNameValue(<%=i%>)"
										value="<%=lName%>"> <%=lName%></strong>
									</span>
								</div>
							</a>

						</div>
					</div>
					<%
						}
					%>
				</div>

			</form>
		</div>
	</div>

	<footer class="site-footer">
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
	<!-- /.bottom-footer --> </footer>
	<!-- /.site-footer -->


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