<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String flag = (String)request.getAttribute("flag");
	HttpSession httpSession = request.getSession(true);
	String memId = (String) httpSession.getAttribute("memId");
	String memPass = (String) httpSession.getAttribute("memPass");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EzCooQ</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
<!-- JavaScript JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800"	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/normalize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/templatemo-misc.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/templatemo-style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath }/js/vendor/modernizr-2.6.2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/createMemberCss.css">

<script type="text/javascript">
	function passCheck(){
		var memPass = $("input[name='memPass']").val();
		if(memPass == "<%=memPass%>"){
			location.href="/EzCooQ/<%=flag%>?memId=<%=memId%>";
		}else{
			$("#passspan").html("비밀번호가 맞지 않습니다.");
		}
	}
</script>
</head>
<body>
	<div class="box" style="text-align: center; margin-top:200px;">
		<h1>
			<span class="colorSpan">EzCooQ</span>
		<%if("updateMember".equals(flag)){%> 
			<span id="titlespan">정보수정</span>
		<%}else if("deleteMember".equals(flag)){%> 
			<span id="titlespan">회원탈퇴</span>
		<%} %>
		</h1>
		
		<form>
			<input type="password" name="memPass" placeholder="비밀번호를 입력해주세요." style="width:500px">
			<br>
			<span style="color:red; padding-right:350px;" id="passspan"></span>
		</form>
		<table>
			<tr>
				<td><br>&nbsp;&nbsp;&nbsp; 
					<Button id="sendbtn" type="button" class="btn" onclick="passCheck()">
						<%if("updateMember".equals(flag)){%>이동<%} %>
						<%if("deleteMember".equals(flag)){%>회원탈퇴하기<%} %>
					</Button>
			</tr>
		</table>
	</div>
</body>
</html>
