<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Easy하게 요리하자 - EzCooQ</title>
<link rel="stylesheet" href="../../css/chatCss.css">
<style>
/* 여러 채팅창 간의 간격과 배열 위치*/
.float-left {
	margin: 50px;
}
</style>
</head>
<body>
	<!-- 채팅 영역 -->
	<div class="chatDiv">
		<h2>관리자와의 채팅!</h2>
		<textarea id="messageTextArea" disabled="disabled"class="noresize" rows="10" cols="50"></textarea>
		<!-- 텍스트 박스에 채팅의 내용을 작성한다. -->
		<br>
		<form>
			<input class="inputCht" id="textMessage" type="text" onkeydown="retrun enter()">
			<!-- 서버로  메세지를 전송하는 버튼  -->
			<input onclick="sendMessage()" value="전송" type="button" class="subChat">
		</form>
	</div>
	<!-- 서버와 메세지를 주고 받는 콘솔 텍스트 영역 -->
	
	<script type="text/javascript">
		//서버의 broadsocket의 서블릿으로 웹 소켓을 한다.
		var webSocket = new WebSocket("ws://localhost:8090/EzCooQ/broadsocket");
		// 콘솔 텍스트 영역
		var messageTextArea = document.getElementById("messageTextArea");
		// 접속이 완료되면
		webSocket.onopen = function(message) {
			messageTextArea.value += "연결되었습니다....\n";
		};
		webSocket.onclose = function(message) { };
		// 에러가 발생하면 콘솔에 메시지를 남긴다.
		webSocket.onerror = function(message) {
			messageTextArea.value += "error...\n";
		};
		// 서버로부터 메시지가 도착하면 콘솔 화면에 메세지를 남긴다.
		webSocket.onmessage = function(message) {
			messageTextArea.value += "(operator) => " + message.data + "\n";
		};
		
		function sendMessage() {
			let message = document.getElementById("textMessage");
			messageTextArea.value += "나 => " + message.value + "\n";
			webSocket.send(message.value);
			message.value = "";
		}
		function enter() {
			if(event.keyCode == 13){
				sendMessage();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>