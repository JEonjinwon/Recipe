<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.report.vo.ReportVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%HttpSession httpSession = request.getSession(true);%>
<%String memId = (String) httpSession.getAttribute("memId");%>
<%String memPass = (String) httpSession.getAttribute("memPass");%>
<%

List<ReportVO> reportList=(List<ReportVO>)request.getAttribute("reportList");

%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>신고 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage.css">
  <script src="${pageContext.request.contextPath}/js/myPage.js"></script>
  
  <script type="text/javascript">
  
 function forgive(i){
	var a = $("#hidden"+i).val();
	$("#reportNo").val(a);
 	$("#forgiveForm").submit();
 
 }
 
 function black(i) {
	var a = $("#black"+i).val();
	var b = $("#blackContent"+i).val();
	
	
	$("#blackId").val(a);
	$("#blackListContent").val(b);
	
	$("#blackForm").submit();
}
  
  </script>
  
</head>
<body>
	<div class="container-fluid">
		<div class="row content">
		
			<div class="col-sm-3 sidenav">
				<a	href="/EzCooQ/html/manage/salesManage.jsp"><h2>관리자 페이지</h2></a>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/EzCooQ/html/manage/searchMemberList.jsp">회원목록
							조회</a></li>
					<li><a href="<%=request.getContextPath()%>/reportManage">블랙리스트
							관리</a></li>
				</ul>
				<br>
			</div>
			
			<div class="col-sm-9" style="text-align: center">
				<h1 align="center">신고내역</h1>
					<br> <br>
					<button class="btn btn-info"
						onclick="location.href='<%=request.getContextPath()%>/reportManage'">신고내역
						조회</button>
					<button class="btn btn-info"
						onclick="location.href='<%=request.getContextPath()%>/SelectBlackList'">블랙리스트 관리</button>
					<table class="table">
						<thead>
							<tr>
								<th>신고번호</th>
								<th>신고 사유</th>
								<th>게시글 번호</th>
								<th>신고ID</th>
								<th>신고일</th>
								<th>블랙
									<form action="${pageContext.request.contextPath }/black"
										id="blackForm" method="post">
										<input type="hidden" id="blackId" name="blackId"> <input
											type="hidden" id="blackListContent" name="blackListContent">
									</form>
								</th>
								<th>용서
									<form id="forgiveForm"
										action="${pageContext.request.contextPath }/forgiveReport"
										method="post">
										<input type="hidden" id="reportNo" name="reportNo">
									</form>
								</th>
							</tr>
						</thead>

						<%
							for (int i = 0; i < reportList.size(); i++) {
								String hidden = "hidden" + i;
								String black = "black" + i;
								String blackContent = "blackContent" + i;
						%>
						<tbody>
							<tr>
								<td><%=reportList.get(i).getReportNo()%></td>
								<td><%=reportList.get(i).getReportContent()%></td>
								<td><%=reportList.get(i).getBoardNo()%></td>
								<td><%=reportList.get(i).getMemId()%></td>
								<td><%=reportList.get(i).getReportDate()%></td>
								<td>
									<input class="btn btn-info" type="button" id="bBtn1" value="블랙" onclick="black(<%=i%>)"> 
									<input type="hidden" id="<%=black %>" value="<%=reportList.get(i).getMemId() %>"> 
									<input type="hidden" id="<%=blackContent %>" value="<%=reportList.get(i).getReportContent()%>">
								</td>
								<td><input class="btn btn-info" type="button" id="bBtn2" value="용서" onclick="forgive(<%=i%>)"> 
								<input type="hidden" id="<%=hidden%>" value="<%=reportList.get(i).getReportNo()%>"></td>
							</tr>
						</tbody>
						<%
						}
					%>
					</table>
			</div>
		</div>
	</div>		
					
		
</body>
</html>
