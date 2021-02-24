<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% MemberVO memberVO = new MemberVO(); 
   NoticeVO noticeVO = (NoticeVO)request.getAttribute("updateNotice");
%>
<!--  세션에서 로그인 정보 갖고 옴 -->
<%	HttpSession httpSession = request.getSession(true);%>
<%	String memId = (String) httpSession.getAttribute("memId");%>
<%	String memPass = (String) httpSession.getAttribute("memPass");%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<title>Easy하게 요리하자 - EzCooQ</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<!-- JS & CSS-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./././css/bootstrap.css">
<link rel="stylesheet" href="./././css/normalize.min.css">
<link rel="stylesheet" href="./././css/font-awesome.min.css">
<link rel="stylesheet" href="./././css/animate.css">
<link rel="stylesheet" href="./././css/templatemo-misc.css">
<link rel="stylesheet" href="./././css/templatemo-style.css">
<link rel="stylesheet" href="./././css/Slide.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./././js/mainPageJs.js"></script>

</head>
<body onload="disableButton('<%=memId%>')">
	<header class="site-header">
		<div class="top-header">
			<div class="container">
				<div class="row">
					<div class="col-xs-6 col-sm-6">
						<div class="top-header-left">
							<div class="btn-group">
								<%if(memId == null){ %>
									<button type="button" class="btn btn-danger" onclick="createMember()">회원가입</button>
									<button type="button" class="btn btn-danger" onclick="login()">로그인</button>
								<%}else{ %>
									<button type="button" class="btn btn-danger" onclick="logout()">로그아웃</button>
									<button type="button" class="btn btn-danger" onclick="chating()">1:1채팅</button>
									<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">신고하기</button>
									<button type="button" class="btn btn-danger" onClick="location.href='cart/cart.html'">장바구니</button>
									<button type="button" class="btn btn-danger" onClick="location.href='myPage/cart.html'" id="myPageBtn">마이페이지</button>
								<%} %>
							</div>
						</div>
						<!-- /.top-header-left -->
					</div>
					<!-- /.col-xs-6 -->

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
								<a href="mainPage.jsp">EzCooQ</a>
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
								<li><a href="product-detail.html">Mini Game</a></li>
								<li><a href="/EzCooQ/noticeMain?noticeCate='공지사항'">공지사항</a></li>
								<li><a href="/EzCooQ/noticeMain?noticeCate='QNA'">Q&A</a></li>
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
				<form method="post" action="updateNotice">
					<div class="table-responsive">
						<table class="table table-striped"
														style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 수정</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control" placeholder="글 제목" maxlength="50" class="inputStyle" name="updateTitle" /> 
										<input type="hidden"name="updateDate" value=<%=noticeVO.getNoticeDate()%>> 
										<input type="hidden" name="noticeNo" value=<%=noticeVO.getNoticeNo()%>></td>
								</tr>
								<tr>
									<td><textarea class="form-control" placeholder="글 내용" name="updateCotent" maxlength="2048" style="height: 350px; resize: none;"></textarea>
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