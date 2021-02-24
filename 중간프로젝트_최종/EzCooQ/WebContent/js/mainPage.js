	function search(){
		$("#searchForm").submit();
	}
	
   function chatPopup(){
        var url = "/EzCooQ/html/chat/chatLink.html";
        window.open(url, '_blank', 'width=600px,height=600px,toolbars=no,scrollbars=no, resizable=no');
   }
	
	function cart() {
		$("#cartForm1").submit();
	}
	function BuyPage() {
		$("#cartForm2").submit();
	}
	

// 로그인 팝업창 띄우기
	function login(){
		window.open('/EzCooQ/html/loginPage.jsp',
				'_blank',
				'width=450px,height=400px,toolbars=no,scrollbars=no, resizable=no'
		);
	}
	function logout(){
		$.ajax({
			url : "/EzCooQ/loginServlet",
			type : "POST",
			data : {"flag" : "deleteLoginSession"},
			dataType : "json",
			success : function(data) {
				if(data.check == "true"){
					alert("로그아웃 되었습니다.");
					location.reload();
				}
			},
			error : function(xhr) {
				console.log(xhr);
				alert("세션제거안됨");
			}
		});
	}
	
	// 로그인성공시 세션 생성하기
	function createLoginSession(memId, memPass){
		$.ajax({
			url : "/EzCooQ/loginServlet",
			type : "POST",
			data : {"memId" : memId, "memPass" : memPass, "flag" : "createLoginSession"},
			dataType : "json",
			success : function(data) {
				if(data.check == "true"){
					location.reload();
				}
			},
			error : function(xhr) {
				console.log(xhr);
				alert("세션생성안됨");
			}
		});
	}
	
	function createMember(){
		window.open('/EzCooQ/html/createMember.html',
				'_blank', 
				'width=1000px,height=1000px,toolbars=no,scrollbars=no resizable=no'
		); 
	}
	
	function chating(){
		window.open('/EzCooQ/html/chat/chat.jsp', 
				'_blank',
				'width=500px,height=500px,toolbars=no,scrollbars=no'
		);
	}
	
	function getHighRank(){
		$.ajax({
			url: "/EzCooQ/getHighRank"
			,type : "post"
			,dataType : "json"
			,success : function(data){
				slider(data);
			}
			,error : function(xhr){
				console.log(xhr);
				alert("실패 : " + xhr.status);
			}
		})
	}
	
	
	function slider(data){
		for(var i=0 ; i<data.length; i++){
			var location = "/EzCooQ/SelectBoardAll?boardNo=" + data[i].boardNo;
			$("#slide"+ (i+1)).html(data[i].boardTitle);
			$("#slideImg" + (i+1)).attr("src", data[i].boardImg);
			$("#slideImg" + (i+1)).attr("onclick", "location.href='"+location+"'");
		}
	}
	
	
	function payStart(memId, money){
		$.ajax({
			url : "/EzCooQ/memInfoServlet",
			type : "post",
			data : {"memId" : memId},
			dataType : "json",
			success : function(data){
				var tel = data.tel;
				if(tel.length == 11){
					tel = tel.substr(0, 3) + "-" + tel.substr(3, 4) + "-" + tel.substr(7, 4);
				}
				console.log(tel);
				pay(data.mail, data.name, tel, memId, money);
			}
		});
	}
	
	function pay(mail, name, tel, memId, money){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp72306381'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'samsung',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명: '+ money + 'P',
		    amount : 10000,
		    buyer_email : mail,
		    buyer_name : name,
		    buyer_tel : tel
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '\n 충전된 포인트 : ' + money + 'P';
			    alert(msg);
			    chargePoint(memId , money);
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
			    alert(msg);
		    }
		});	
	}
	
	function chargePoint(memId, money){
		var memLastPoint = "포인트 충전 -" + money + "P";
		console.log(memLastPoint);
		$.ajax({
			url : "/EzCooQ/pointChargeServlet",
			type : "post",
			data : {"memId" : memId, "point" : money, "memLastPoint" : memLastPoint},
			dataType : "json",
			success : function(data){
				if(data.check == "true"){
					return;
				}else{
					alert("결제에는 성공했지만 포인트충전에 실패했습니다. \n 1:1문의로 알려주세요 죄송합니다.");
				}
			}
		});
	}
