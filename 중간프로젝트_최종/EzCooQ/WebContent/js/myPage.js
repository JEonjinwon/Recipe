
//내정보 조회
function selectMember(memIdVal){
	$.ajax({
		type:"post"
		,url:"/EzCooQ/selectMember"
		,data : {"memId" : memIdVal}
		,dataType:"json"
		,success:function(data){
			var memId = data.memId;
			var memName = data.memName;
			var memTel = data.memTel;
			var memMail = data.memMail; 
			var memBir = data.memBir.substr(0, 10);
			var memGender = data.memGender;
			var memPoint = data.memPoint;
			var memLastPoint = data.memLastPoint;
			var memGrade = "브론즈";
			var point = parseInt(memPoint,10)/10000;
			var pointPer = Math.floor((point - Math.floor(point))*100);
			if(point >= 1 &&  point < 2){
				memGrade = "실버";
				$("#expBar").css("width", pointPer + "%");
			}else if(point >= 2 && point < 3){
				memGrade = "골드";
				$("#expBar").css("width", pointPer + "%");
			}else if(point >= 3 &&  point < 4){
				memGrade = "플래티넘";
				$("#expBar").css("width", pointPer + "%");
			}else if(point >= 4 &&  point < 5){
				memGrade = "다이아몬드";
				$("#expBar").css("width", pointPer + "%");
			}else if(point >= 5){
				memGrade = "VIP";
				$("#expBar").css("width", '100%');
			}
			
			$("#memId").html(memId);
			$("#memNameSpan").html(memName);
			$("#memNameDiv").html(memName);
			$("#memGender").html(memGender);
			$("#memBir").html(memBir);
			$("#memMail").html(memMail);
			$("#memTel").html(memTel);
			$("#memPoint").html(memPoint);
			$("#memLastPoint").html(memLastPoint);
			$("#memGrade").html(memGrade);
			
		}
		,error:function(xhr){
			console.log(xhr.status);
		}
	});
}

//내가 쓴 글
function selectMyBoard(memIdVal){
	var html = "<tr>"
			+	"<th>제목</th>"
			+	"<th>작성일</th>"
			+	"</tr>"; 
	$.ajax({
		type:"post"
		,url:"/EzCooQ/selectMyBoard"
		,data : {"memId" : memIdVal}
		,dataType:"json"
		,success:function(data){
			if(data.length > 0){
				for(var i=0; i<data.length; i++){
					html += "<tr>" +
							"<td id='boardTd'>" + data[i].boardTitle +"</td>" +
							"<td id='boardTd'>" + data[i].boardDate +"</td>" +
							"</tr>";
				}
			}else{
				html += "<tr><td id='emptyBoard' colspan='2'>내가 작성한 글이 없습니다.</td></tr>";
			}
			$("#myBoardTable").html(html);
		}
		,error:function(xhr){
			console.log(xhr.status);
		}
	});
}

//내가 쓴 댓글
function selectMyComment(memIdVal){
	var html = "<tr>"
		+	"<th>평점</th>"
		+	"<th>내용</th>"
		+	"<th>작성일</th>"
		+	"</tr>";
	$.ajax({
		type:"post"
		,url:"/EzCooQ/selectMyComment"
		,data : {"memId" : memIdVal}
		,dataType:"json"
		,success:function(data){
			if(data.length > 0){
				for(var i=0; i<data.length; i++){
					html += "<tr>" +
							"<td id='commentTd'>" + data[i].comStar +"</td>" +
							"<td id='commentTd'>" + data[i].comContent +"</td>" +
							"<td id='commentTd'>" + data[i].comDate +"</td>" +
							"</tr>";
				}
			}else{
				html += "<tr><td id='emptyComment' colspan='3'>내가 작성한 댓글이 없습니다.</td></tr>";
			}
			$("#myCommentTable").html(html);
		}
		,error:function(xhr){
			console.log(xhr.status);
		}
	});
}


//정보수정, 회원탈퇴
function passCheckPopUp(flag){
	if(flag == 'updateMember'){
		window.open('/EzCooQ/passCheck?flag=updateMember',
				'_blank',
				'width=1000px,height=1000px,toolbars=no,scrollbars=no, resizable=no'
		);
	}else if(flag == 'deleteMember'){
		window.open('/EzCooQ/passCheck?flag=deleteMember',
				'_blank',
				'width=1000px,height=1000px,toolbars=no,scrollbars=no, resizable=no'
		);
	}
}


/**
 * 회원정보수정할때 쓰는 스크립트
 */

	var passCheck = false;
	var pass2Check = false;
	var nameCheck = false;
	var birCheck = false;
	var telCheck = false;
	var mailCheck = false;
	var genderCheck = false;
	//정보수정 완료버튼 눌렀을때
	function updateMember() {
		if(passCheck && pass2Check && nameCheck && birCheck && telCheck && mailCheck && genderCheck){
			updateForm.submit();
		}else{
			alert("빠진게 없나 확인해주세요");
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
	   if(gender == "남성" || gender == "여성"){
		   genderCheck = true;
		   $('#genderspan').empty();
	   }else{
		   genderCheck = false;
		   $('#genderspan').html("성별을 선택해주세요.").css('color', 'red');
	   }
	}


