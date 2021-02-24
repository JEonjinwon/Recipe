<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO" %>
<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList3");
%>
<%	HttpSession httpSession = request.getSession(true);%>
<%	String memId = (String) httpSession.getAttribute("memId");%>
<%	String memPass = (String) httpSession.getAttribute("memPass");%>
    
    
 <!DOCTYPE html>

<html class="no-js">

<head>

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
<style>
	
</style>

</head>
<body>
	<script type="text/javascript">
function cart() {
	$("#cartForm1").submit();
}
function BuyPage() {
	$("#cartForm2").submit();
}

</script>
	<header class="site-header">
		<div class="top-header">
			<div class="container">
				<div class="row align-right">
				<%if(memId != null){%>
					<span class="idSpan right-padding"><a href="#" onclick="payStart('<%=memId%>', 10000)">포인트 충전</a></span>
					<span class="idSpan right-padding"><a href="#" onclick="chating()">관리자 1:1 문의</a></span>
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
							<li><a href="product-detail.jsp">미니게임</a></li>
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
	<div>
	<%if(memId !=null){ %>
		<input type="button" class="form-control" value="새글작성" onclick="location.href='/EzCooQ/InsertRecipe'" style="width:100px; float: right; margin-right: 23%;">
	<%} %>
	</div>



	<div class="content-section1">
		<div class="container">
			<div class="row">
			<br><br><br><br>
				<div class="col-md-6" id="divLeft">
						<%
							int boardSize = boardList.size();
							if(boardSize > 0) {
								for(int i=0; i<boardSize/2; i++){
						%>			
							<div class="product-item-1">
					
					
						<div class="product-thumb1">
							<img src="<%=boardList.get(i).getBoardImg() %>" alt="Product Title" style="width: 400px; height: 250px;">
						</div>
						<!-- /.product-thumb -->
						<div class="product-content" style="width: 400px;">
							<h5>
								<a href="<%=request.getContextPath()%>/SelectBoardAll?boardNo=<%=boardList.get(i).getBoardNo()%>"><%=boardList.get(i).getBoardTitle() %></a>
							</h5>
							<br>
							<div style="display: flex; justify-content:flex-end">
							<span class="tagline" style="float:right;"></span>
							<span class="glyphicon glyphicon-eye-open">
							<%=boardList.get(i).getBoardCnt() %></span>
							</div>
							<span class="price"><%=boardList.get(i).getMemId() %></span>
							
							
							<p><%=boardList.get(i).getBoardLike() %></p>
						</div>
						<!-- /.product-content -->
					</div>
			
					<% 
					}
					%>
					<%
					} 
							%>
				</div> <!-- /.col-md-6 -->
				
				<div class="col-md-6" id="divRight">
						<%
							int boardSize1 = boardList.size();
							if(boardSize1 > 0) {
								for(int i=boardSize1/2; i<boardSize1; i++){
						%>			
							<div class="product-item-1">
					
					
						<div class="product-thumb1">
							<img src="<%=boardList.get(i).getBoardImg() %>" alt="Product Title" style="width: 400px; height: 250px;">
						</div>
						<!-- /.product-thumb -->
						<div class="product-content" style="width: 400px;">
							<h5>
								<a href="<%=request.getContextPath()%>/SelectBoardAll?boardNo=<%=boardList.get(i).getBoardNo()%>"><%=boardList.get(i).getBoardTitle() %></a>
							</h5>
							<br>
							
							<div style="display: flex; justify-content:flex-end">
							<span class="tagline" style="float:right;"></span>
							<span class="glyphicon glyphicon-eye-open">
							<%=boardList.get(i).getBoardCnt() %></span>
							</div>
							<span class="price"><%=boardList.get(i).getMemId() %></span>
							
							
							<p><%=boardList.get(i).getBoardLike() %></p>
						</div>
						<!-- /.product-content -->
					</div>
			
					<% 
					}
					%>
					<%
					} 
							%>
				</div> <!-- /.col-md-6 -->
			</div><!-- row -->

		</div><!--container -->
	</div><!-- 	content-section1 -->
			
		
	
				


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
				</div>
			</div>
		</div>
	</footer>

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