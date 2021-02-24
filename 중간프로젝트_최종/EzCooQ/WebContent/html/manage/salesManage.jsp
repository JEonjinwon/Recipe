<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HttpSession httpSession = request.getSession(true);
	String memId = (String) httpSession.getAttribute("memId");
	String memPass = (String) httpSession.getAttribute("memPass");
	String getPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>매출 관리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage.css">
<script src="${pageContext.request.contextPath}/js/myPage.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row content">
		
			<div class="col-lg-3 sidenav">
				<a	href="/EzCooQ/html/manage/salesManage.jsp"><h2>관리자 페이지</h2></a>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/EzCooQ/html/manage/searchMemberList.jsp">회원목록
							조회</a></li>
					<li><a href="<%=getPath%>/reportManage">블랙리스트
							관리</a></li>
				</ul>
				<br>
			</div>
			
			<div class="col-lg-9" style="text-align: center">
				<h1 style="margin-left:170px">관리자 페이지</h1>
				<a href="<%=getPath%>/html/mainPage.jsp"><img src="<%=getPath%>/images/manage.jpeg" style="width: 50%; height: 20%; margin-left: 20%;"></a>
			</div>
		</div>
	</div>		
		
</body>
</html>
