<%@page import="java.util.List"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.Element"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
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
<%	HttpSession httpSession = request.getSession(true);%>
<%	String memId = (String) httpSession.getAttribute("memId");%>
<%	String memPass = (String) httpSession.getAttribute("memPass");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공식레시피</title>

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
	text-align: center;
}
.site-footer{
	position: relative;
}
</style>
<script type="text/javascript">
	function Classification2() {

		var CfRadio = $("input:radio[name=Classification]:checked").val();

		for (var i = 0; i < 100; i++) {
			var ClassificationDivVal = $("#ClassificationDiv" + i)
					.attr("class");
			$("#ClassificationDiv" + i).hide();

			if (CfRadio == ClassificationDivVal) {

				$("." + ClassificationDivVal).show();
			} else if (CfRadio == "전체") {

				$("#ClassificationDiv" + i).show();
			}
		}

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

			<form action="#">
				<h1>
					<strong>분류 </strong>
				</h1>
				<label><input type="radio" name="Classification" value="전체">전체선택</label>
				<label><input type="radio" name="Classification" value="밥">밥</label>
				<label><input type="radio" name="Classification" value="국">국&찌개</label>
				<label><input type="radio" name="Classification" value="반찬">반찬</label>
				<label><input type="radio" name="Classification" value="일품">일품</label>
				<label><input type="radio" name="Classification" value="후식">후식</label>
				<input type="button" value="찾기" onclick="Classification2()">

				<hr>
				<br>
				<div class="col-md-6">
					<%
						String MANUAL = "MANUAL";
						String MANUALIMG = "MANUAL_IMG";
						for (int i = 0; i < itemNodeList.getLength(); i++) {
							String ClassificationDiv = "ClassificationDiv";
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
					%>



					<p>
					<div id="<%=ClassificationDiv%>" value="<%=Classification2%>"
						class="<%=Classification%>">
						<hr style="border: solid 5px black;">
						<p>
						<h1>
							<strong><%=lName%></strong>
						</h1>
						</p>
						<p>
						<input type="image" src="<%=img%>"
							style="width: 300px; height: auto;">
						</p>
						<p>
							재료 :
							<%=lIngredients%></p>
						<p>
							분류 :
							<%=Classification2%></p>

						<%
							for (int j = 1; j < 21; j++) {
									if (j < 10 && (element.getElementsByTagName(MANUAL + "0" + j).item(0).getTextContent()) != "") {

										cookWay = element.getElementsByTagName(MANUAL + "0" + j).item(0).getTextContent() + "<br>";

										if ((element.getElementsByTagName(MANUALIMG + "0" + j).item(0).getTextContent()) != "") {
											img2 = element.getElementsByTagName(MANUALIMG + "0" + j).item(0).getTextContent();

										}
									} else if (j >= 10 && (element.getElementsByTagName(MANUAL + j).item(0).getTextContent()) != "") {

										cookWay = element.getElementsByTagName(MANUAL + j).item(0).getTextContent() + "<br>";

										if ((element.getElementsByTagName(MANUALIMG + j).item(0).getTextContent()) != "") {
											img2 = element.getElementsByTagName(MANUALIMG + j).item(0).getTextContent();
										}

									}
						%>
						<p><%=cookWay%></p>
						<%
							if (img2 != "") {
						%>
						<input type="image" src=<%=img2%>>
						<%
							}

									cookWay = "";
									img2 = "";

								}
						%>

					</div>
					<%
						}
					%>
				</div>
			</form>
		</div>
	</div>

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

</body>
</html>