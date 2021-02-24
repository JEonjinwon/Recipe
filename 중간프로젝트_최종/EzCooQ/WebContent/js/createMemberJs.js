/**
 * 회원가입할때 쓰는 스크립트
 */

	var idCheck = false;
	var passCheck = false;
	var pass2Check = false;
	var nameCheck = false;
	var birCheck = false;
	var telCheck = false;
	var mailCheck = false;
	var genderCheck = false;
	
	//회원가입 완료버튼 눌렀을때
	function join() {
		if(idCheck     && 
	    	passCheck  && 
			pass2Check &&
			nameCheck  && 
			birCheck   && 
			telCheck   && 
			mailCheck  && genderCheck) {
			joinform.submit();
		}else{
			alert("빠진게 없나 확인해주세요");
		}
	}
	
	// 아이디 양식 체크 및 중복 검사
	function idChecking(){
		var id = document.getElementById("id");
		var re = /^[a-zA-Z0-9]{4,12}$/
		console.log("memid : " + id.value);
		if(re.test(id.value)){
			$.ajax({
				url : "/EzCooQ/checkMember",
				type : "POST",
				data : {
					"memId" : id.value
				},
				dataType : "json",
				success : function(data) {
					if ("true" == data.checkStr) {
						idCheck = true;
						$("#idspan").html("현재 아이디는 사용 가능합니다.").css("color", "green");
					}else{
						idCheck = false;
						$("#idspan").html("이미 있는 아이디입니다.").css("color", "red");
					}
				},
				error : function(xhr) {
					console.log(xhr);
				}
			});
		}else{
			idCheck = false;
			$("#idspan").html("아이디는 4~12자의 영문 대소문자와 숫자만 가능합니다").css("color", "red");
		}
	}
	
	// 비밀번호 검사
	function passChecking(){
		var pass = document.getElementById("pass").value;
		var re = /^[a-zA-Z0-9]{4,12}$/;
		if(re.test(pass)){
			passCheck = true;
			$("#passspan").html("사용가능한 비밀번호입니다.").css("color", "green");
		}else{
			passCheck = false;
			$("#passspan").html("비밀번호는 4~12자의 영문 대소문자와 숫자만 가능합니다").css("color", "red");
		}
	}
	
	// 비밀번호 확인 검사
	function pass2Checking(){
		var pass = document.getElementById("pass").value;
		var pass2 = document.getElementById("pass2").value;
		console.log("length" + pass2.length);
		if(pass2.length == 0){
			pass2Check = false;
			$("#pass2span").empty();
			return;
		}
		if(pass == pass2){
			pass2Check = true;
			$("#pass2span").html("일치합니다").css("color", "green");
		}else{
			pass2Check = false;
			$("#pass2span").html("비밀번호가 일치하지 않습니다").css("color", "red");
		}
	}
	
	// 이름 작성했는지
	function nameChecking(){
		var name = document.getElementById("name").value;
		if(name == null || name == ""){
			$("#namespan").html("필수 입력사항입니다.").css("color", "red");
			nameCheck = false;
		}else{
			$("#namespan").empty();
			nameCheck = true;
		}
	}
	
	// 생일체크
	function birChecking(){
		var bir = document.getElementById("bir").value;
		if(bir.length < 8){
			$("#birspan").html("생년월일 8자리를 입력해주세요").css("color", "red");
			birCheck = false;
			return;
		}
		var today = new Date(); //날짜
		var yearNow = today.getFullYear(); // 올해년도
		var year = Number(bir.substr(0,4)); // 태어난 년도
		console.log("year : " + year);
		console.log("yearNow : " + yearNow);
		var reg = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		if(yearNow - 125 > year || !reg.test(bir)){
			birCheck = false;
			$("#birspan").html("생년월일을 정확히 입력해주세요.").css("color", "red");
		}else{
			birCheck = true;
			$("#birspan").empty();
		}
	}
	
	// 전화번호 체크
	function telChecking(){
		var tel = document.getElementById("tel").value;
		var reg = /^01([0|1|6|7|8|9]?)?([1-9][0-9]{2,3})?([0-9]{4})$/;
		if(reg.test(tel)){
			telCheck = true;
			$("#telspan").empty();
		}else{
			telCheck = false;
			$('#telspan').html("전화번호를 정확히 입력해주세요.").css('color', 'red');
		}
	}
	
	// 메일체크
	function mailChecking(){
	   var mail = document.getElementById("mail").value;
	   var reg = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);    
	   if (reg.test(mail)) {
	      mailCheck = true;
	      $('#mailspan').empty();
	   }else{
	      mailCheck = false;
	      $('#mailspan').html("메일을 정확히 입력해주세요.").css('color', 'red');
	   }
	}
	
	function genderChecking(){
	   var gender = document.getElementById("genderSelect").value;
	   console.log(gender);
	   if(gender == "남성" || gender == "여성"){
		   genderCheck = true;
		   $('#genderspan').empty();
	   }else{
		   genderCheck = false;
		   $('#genderspan').html("성별을 선택해주세요.").css('color', 'red');
	   }
	}