<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	HttpSession httpSession = request.getSession(true);
	String memId = (String) httpSession.getAttribute("memId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EzCooQ</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
<!-- JavaScript JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/EzCooQ/css/bootstrap.css">
<link rel="stylesheet" href="/EzCooQ/css/normalize.min.css">
<link rel="stylesheet" href="/EzCooQ/css/font-awesome.min.css">
<link rel="stylesheet" href="/EzCooQ/css/animate.css">
<link rel="stylesheet" href="/EzCooQ/css/templatemo-misc.css">
<link rel="stylesheet" href="/EzCooQ/css/templatemo-style.css">

<script src="/EzCooQ/js/vendor/modernizr-2.6.2.min.js"></script>
<link rel="stylesheet" href="/EzCooQ/css/createMemberCss.css">

<script type="text/javascript">
	function deleteSurvey(){
		$("#form").submit();
		window.close();
		
	}
</script>
</head>
<body>
	<div class="box">
		<h1><span class="colorSpan">EzCooQ</span>회원탈퇴완료</h1>
		<h2 id="titleh2">탈퇴에 성공하였습니다.</h2>
		<div>
			<form id="form" action="/EzCooQ/delReason" method="post">
					<br>회원님의 탈퇴사유를 알려주세요 :
					<br>
					<textarea name="delReason" rows="4" cols="50" style="resize:none"></textarea>
					<br><span class="span-margin" id="idspan"></span>
					<input type="hidden" name="memId" value="<%=memId%>">
			</form>
		</div>
		<table>
			<tr>
				<td><br>&nbsp;&nbsp;&nbsp; 
					<Button id="sendbtn" type="button" class="btn" onclick="deleteSurvey()">닫기</Button> 	
			</tr>
		</table>
	</div>
</body>
</html>













