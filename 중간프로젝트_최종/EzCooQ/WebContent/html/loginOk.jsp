<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("memId");
	String pass = request.getParameter("memPass");
	
	Cookie cook1 = new Cookie("memId", id);
	
	cook1.setMaxAge(60*60);
	
	Cookie cook2 = new Cookie("memPass",pass);
	cook2.setMaxAge(60*60);
	
	response.addCookie(cook1);
	response.addCookie(cook2);
	
%>
쿠키가 생성되었다<br>
<a href="/EzCooQ/html/mainPage.jsp">다른페이지로 이동</a>
</body>
</html>