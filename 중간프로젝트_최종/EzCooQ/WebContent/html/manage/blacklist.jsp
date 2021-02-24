<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.report.vo.BlackListVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%HttpSession httpSession = request.getSession(true);%>
<%String memId = (String) httpSession.getAttribute("memId");%>
<%String memPass = (String) httpSession.getAttribute("memPass");
     List<BlackListVO> blackList= (List<BlackListVO>)request.getAttribute("blackList");


%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>블랙리스트</title>
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
    <div class="col-sm-3 sidenav">
    	<a href="/EzCooQ/html/manage/salesManage.jsp">  <h2>관리자 페이지</h2></a>
      <ul class="nav nav-pills nav-stacked">
		<li><a href="/EzCooQ/html/manage/searchMemberList.jsp">회원목록 조회</a></li>
		<li><a href="<%=request.getContextPath()%>/reportManage">블랙리스트 관리</a></li>
      </ul><br>
    </div>
  <div class="col-sm-9 text-left"> 
      <h1 align="center">블랙리스트</h1><br><br>
      <button class = "btn btn-info" onclick="location.href='<%=request.getContextPath()%>/reportManage'">신고내역 조회</button>
      <button class = "btn btn-info" onclick="location.href='<%=request.getContextPath()%>/SelectBlackList'">블랙리스트 관리</button>
	      <table class="table">
			  <thead>
			    <tr>
			      <th></th>
			      <th>아이디</th>
			      <th>블랙사유</th>
			      <th>블랙날짜</th>
			    </tr>
			  </thead>
			  <%for(int i=0; i<blackList.size();i++) {%>
			  <tbody>
			    <tr>
			      <td></td>
			      <td><%=blackList.get(i).getMemId() %></td>
			      <td><%=blackList.get(i).getbReason() %></td>
			      <td><%=blackList.get(i).getbDate() %></td>
			    </tr>      
			  
			  </tbody>
			  <%} %>
  		</table>
    </div>
    </div>
</div>

</body>
</html>
