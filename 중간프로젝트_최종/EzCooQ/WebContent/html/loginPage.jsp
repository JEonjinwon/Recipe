<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인~</title>

<!-- JavaScript JS -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/normalize.min.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/templatemo-misc.css">
<link rel="stylesheet" href="../css/templatemo-style.css">
<link rel="stylesheet" href="../css/login.css">
<script src="../js/mainPage.js"></script>
<script src="../js/vendor/modernizr-2.6.2.min.js"></script>

<script type="text/javascript">
       $(document).ready(function(){
               $(".close").click(function(){ 
               		window.close();
               });
       });
       
       function logInSubmit(){
    	   var memId = $("#loginid").val();
    	   var memPass = $("#loginpw").val();
    		$.ajax({
				url : "/EzCooQ/loginServlet",
				type : "POST",
				data : $("#logInFm").serialize(),
				dataType : "json",
				success : function(data) {
					console.log("check :" +  data.check);
					if(data.check == "true"){
						opener.createLoginSession(memId, memPass);
						alert("로그인 되었습니다.");
						window.close();
					}else{
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					}
				},
				error : function(xhr) {
					console.log(xhr);
					alert("로그인 도중 문제가 발생했습니다. 오류코드 : 10110001 (심각, 진지, 위험)")
				}
			});
       }
</script>
</head>
<body>

	<div class="loginbox">
		<div class="loginbox-main">
			<h1>로그인</h1>
		</div>
		<form id="logInFm" method="post" >
			<input type="hidden" value="logInCheck" name="flag"><br/>
			<label for="loginid" class="labelid">아이디</label>
			<input type="text" id="loginid" name="memId"><br/>
			<label for="loginpw" class="labelpw">패스워드</label>
			<input type="password" id="loginpw" name="memPass">
			<div class="search">
				<span class="text">아이디 또는 비밀번호를 잊으셨나요?</span>	
				<a href="#">ID/PW찾기</a>
			</div>
			<div class="btnwrap">
				<button type="button" onclick="createMember()" id="createbtn">회원가입</button>
				<button type="button" onclick="logInSubmit()" id="loginbtn">로그인</button>
			</div>
		</form>
	</div>
</body>
</html>