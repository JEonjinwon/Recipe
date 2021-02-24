<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO memberVO = new MemberVO();
	NoticeVO noticeVO = (NoticeVO) request.getAttribute("updateQna");
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

<!DOCTYPE html>
<html class="no-js">
<head>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/normalize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/templatemo-misc.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/templatemo-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/Slide.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${pageContext.request.contextPath }/js/main.js"></script>
</head>
<body onload="disableButton('<%=memId%>')">
	<header class="site-header">
		<div class="top-header">
			<div class="container">
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
					<div class="col-xs-6 col-sm-7">
						<div class="list-menu">
							<ul>
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#"> Recipe <span class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li>
											<a href="#">공식 레시피</a>
										</li>
										<li>
											<a href="/EzCooQ/ViewBoardAll">유저 레시피</a>
									 	</li>
									</ul>
								<li><a href="/EzCooQ/html/product-detail.jsp">미니게임</a></li>
								<li><a href="/EzCooQ/noticeMain">공지사항</a></li>
								<li><a href="/EzCooQ/qnaMain">Q&A</a></li>
							</ul>
						</div>
						<!-- /.list-menu -->
					</div>
					<%if(memId != null) {%>
					<div class="col-xs-6 col-sm-5">
						<div class="notification">
							<span><%=memId%> 회원님 안녕하세요!</span>
						</div>
					</div>
					<%}%>
					<div class="col-xs-6 col-sm-5"></div>
					<!-- /.col-xs-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.main-nav -->
	</header>
	<div class="content-section">
									<div class="container">
			<div class="row">
				<form method="post" action="updateQna">
					<div class="table-responsive">
						<table class="table table-striped"
														style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2" style="background-color: #eeeeee; text-align: center;">자주 묻는 질문 수정</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" value = "<%=noticeVO.getNoticeTitle() %>" class="form-control" placeholder="글 제목" maxlength="50" class="inputStyle" name="updateTitle" /> 
										<input type="hidden"name="updateDate" value="<%=noticeVO.getNoticeDate()%>"> 
										<input type="hidden" name="noticeNo" value="<%=noticeVO.getNoticeNo()%>"></td>
								</tr>
								<tr>
									<td><textarea class="form-control" placeholder="글 내용" name="updateContent" maxlength="2048" style="height: 350px; resize: none;"><%=noticeVO.getNoticeContent() %></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<button class="btn btn-warning pull-right">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer class="site-footer">
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

</body>
</html>