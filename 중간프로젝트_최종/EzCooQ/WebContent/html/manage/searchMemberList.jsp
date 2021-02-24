<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%HttpSession httpSession = request.getSession(true);%>
<%String memId = (String) httpSession.getAttribute("memId");%>
<%String memPass = (String) httpSession.getAttribute("memPass");%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="../../js/myPage.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="../../css/myPage.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<script type="text/javascript">
$(document).ready(function(){
	viewMemberAll()
});

	function viewMemberAll(){
		$.ajax({
			url : "/EzCooQ/viewMemberAll"
			,type : "post"
			,data : {
				"memId" : "<%=memId%>"
			}
			,dataType : "json"
			,success : function(data){
				makeMemberList(data);
			}
			,error : function(xhr){
				alert("실패 : " + xhr.status);
			}
		})
	}
	
	function makeMemberList(data){
		var option = "<h1>회원관리</h1><br><br><br><table class='table'><tr><th>아이디</th><th>이름</th><th>비밀번호</th><th>생일</th><th>성별</th><th>전화번호</th><th>메일</th><th>수정 여부</th><th>포인트</th></tr>";
		for(var i = 0; i < data.length; i++){
			option += "<tr>"
				   + "<td>"
				   + data[i].memId +"</td>"
				   + "<td>"
				   + data[i].memName +"</td>"
				   + "<td>"
				   + data[i].memPass +"</td>"
				   + "<td>"
				   + data[i].memBir +"</td>"
				   + "<td>"
				   + data[i].memGender +"</td>"
				   + "<td>"
				   + data[i].memTel +"</td>"
				   + "<td>"
				   + data[i].memMail +"</td>"
				   + "<td> x </td>"
				   + "<td>"
				   + data[i].pointTotal +"</td>"
				   +"</tr>"
		}
		option +="</table>";
		$("#memberTable").html(option);
		
	}
</script>
<body>
<div class="container-fluid">
  <div class="row content">
    <div class="col-lg-3 sidenav">
     	<a	href="/EzCooQ/html/manage/salesManage.jsp"> <h2>관리자 페이지 <input type = "hidden" name = "memId" value = "<%=memId%>"></h2></a>
      <ul class="nav nav-pills nav-stacked">
		<li><a href="/EzCooQ/html/manage/searchMemberList.jsp">회원목록 조회</a></li>
		<li><a href="<%=request.getContextPath()%>/reportManage">블랙리스트 관리</a></li>
      </ul><br>
    </div>
  <div class="col-lg-9 text-left" id = "memberTable"> 
      
  </div> 	
 </div>
</div>

</body>
</html>