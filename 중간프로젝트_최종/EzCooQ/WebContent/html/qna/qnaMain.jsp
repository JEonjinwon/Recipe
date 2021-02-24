<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.notice.vo.PagingVO"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  세션에서 로그인 정보 갖고 옴 -->
<%
List<NoticeVO> qnaList = (List<NoticeVO>) request.getAttribute("qnaList");
String msg = (String) request.getAttribute("msg");
PagingVO pagingVO = (PagingVO) request.getAttribute("pvo");
MemberVO memberVO = new MemberVO();
// 세션에서 로그인 정보 갖고 옴
HttpSession httpSession = request.getSession(true);
String memId = (String) httpSession.getAttribute("memId");
String memPass = (String) httpSession.getAttribute("memPass");
%>

<!DOCTYPE html>
<html class="no-js">
<head>
<title>EzCooQ - 자주묻는질문</title>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- JS & CSS-->
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qnaCss.css">
</head>

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
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Recipe <span class="caret"></span>
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
				<table>
					<caption>자주 묻는 질문</caption>
					<thead>
						<tr>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
						<%
							int qnaSize = qnaList.size();
							if (qnaSize > 0) { 
						%>
					</thead>
						<tbody>
						<%	for (int i = 0; i < qnaSize; i++) { %>
						<tr>
							<td>
								<a href="qnaView?noticeNo=<%=qnaList.get(i).getNoticeNo()%>" style="color: orange;"><%=qnaList.get(i).getNoticeTitle()%></a>
							</td>
							<td>관리자</td>
							<td><%=qnaList.get(i).getNoticeDate()%></td>
						</tr>
						<%
							}
						%>
						</tbody>
					</table>
				<div style="text-align: center">
						<%
							if (pagingVO.getTotalCount() > 0) {
						%>
						<%		if (pagingVO.getFirstPageNo() > pagingVO.getPageCount()) {
						%>			<a href="<%=request.getContextPath()%>/qnaMain?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageCount()%>">[이전]</a>
						<%		}	%>
						<%		for (int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++) {
						%>			<a href="<%=request.getContextPath()%>/qnaMain?pageNo=<%=pNo%>" style="color: orange;">[<%=pNo%>] </a>
						<%		} %>
						<%		if (pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {
						%>			<a href="<%=request.getContextPath()%>/qnaMain?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageCount()%>">[다음]</a>
						<%		}
						%>
						<%
							}
						%>
					<%  }else{  %>
							<tr>
								<td colspan="3">작성된 게시글이 없습니다.</td>
							</tr>	
						</tbody>
					</table>
					<%  } %>
						
				</div>
				<button type="button" id="insertNoticeBtn"
					class="btn btn-warning pull-right"
					onclick="location.href='<%=request.getContextPath()%>/insertQna'">게시글
					등록</button>
			</div>
		<!-- /.container -->
		</div>
		<!-- /.content-section -->
	</div>
	
	<footer class="site-footer">
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
	

	

	<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.1.min.js"></script>
	<script>
		window.jQuery || document.write('<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.1.min.js">');
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