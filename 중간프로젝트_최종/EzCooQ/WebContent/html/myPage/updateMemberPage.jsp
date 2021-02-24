<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String memId = (String) request.getAttribute("memId"); %>
<% String memPass = (String) request.getAttribute("memPass"); %>
<% String memName = (String) request.getAttribute("memName"); %>
<% String memTel = (String) request.getAttribute("memTel"); %>
<% String memMail = (String) request.getAttribute("memMail"); %>
<% String memBir = (String) request.getAttribute("memBir"); %>
<% String memGender = (String) request.getAttribute("memGender"); %>

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
	$(document).ready(function(){
		var Birth = "<%=memBir%>".split("-");
		var memBir = Birth[0]+Birth[1]+Birth[2];
		memBir = memBir.substr(0, 8);
		console.log(memBir);
		$("input[name='memId']").val("<%=memId%>");
		$("input[name='memName']").val("<%=memName%>");
		$("input[name='memBir']").val(memBir);
		$("input[name='memTel']").val("<%=memTel%>");
		$("input[name='memMail']").val("<%=memMail%>");
		
		var memGender = "<%=memGender%>";
		if(memGender == "남성"){
			$("option:nth(1)").attr("selected", "selected");
		}else{
			$("option:nth(2)").attr("selected", "selected");
		}
		
		nameChecking();
		birChecking();
		telChecking();
		mailChecking();
		genderChecking();
	});
</script>
</head>
<body>
	<div class="box">
		<h1><span class="colorSpan">EzCooQ</span> <sub> 정보수정</sub></h1>
		<fieldset>
			<form id="updateForm" action="/EzCooQ/updateMember" method="post">
				<br> <label for="id">아이디 : </label> 
				<input type="text" name="memId" id="id" readonly="readonly">
				<br><span class="span-margin" id="idspan"></span>
				<hr>

				<label for="pass">비밀번호 : </label> 
				<input type="password" maxlength="12" id="pass" name="memPass" onblur="passChecking()" placeholder="비밀번호를 입력해주세요.">
				<br><span class="span-margin" id="passspan"></span>
				<hr>

				<label for="pass2">비밀번호 확인: </label> 
				<input type="password" maxlength="12" id="pass2" onblur="pass2Checking()" placeholder="비밀번호를 한번 더 입력해주세요.">
					<br> <span class="span-margin" id="pass2span"></span>
				<hr>
				
				<label for="name">이름 : </label> 
				<input type="text" maxlength="30" placeholder="이름을 입력해주세요." name="memName" id="name" onblur="nameChecking()">
				<br> <span class="span-margin" id="namespan"></span>
				<hr>

				<label for="bir">생년월일 : </label> 
				<input type="text" maxlength="8" placeholder="8자리 ex)19990101" name="memBir" id="bir" onblur="birChecking()">
				<br> <span class="span-margin" id="birspan"></span>
				<hr>

				<label for="tel">전화번호 : </label> 
				<input type="text" maxlength="11" placeholder="-없이 입력해주세요." name="memTel" id="tel" onblur="telChecking()"><br>
				<span class="span-margin" id="telspan"></span>
				<hr>

				<label for="mail">이메일 : </label> 
				<input type="text" maxlength="40" placeholder="이메일을 입력해주세요." name="memMail" id="mail" onblur="mailChecking()">
				<br> <span class="span-margin" id="mailspan"></span>
				<hr>
				<label for="gender">성별 : </label>
				<select class="selectDiv" id="genderSelect" name="memGender" onchange="genderChecking()">
					<option value="선택">선택</option>
					<option value="남성">남성</option>
					<option value="여성">여성</option>
				</select>
				<br><span class="span-margin" id="genderspan"></span>
				<br><br>
			</form>
		</fieldset>
		<table>
			<tr>
				<td>
				<Button id="sendbtn" type="button" class="btn" onclick="updateMember()">수정</Button> 	
			</tr>
		</table>
	</div>
	<script src="${pageContext.request.contextPath}/js/myPage.js"></script>
</body>
</html>













