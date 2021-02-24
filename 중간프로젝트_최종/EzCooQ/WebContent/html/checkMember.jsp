<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean check = (Boolean) request.getAttribute("check");
	System.out.println(check);
	String msg = check ? "이미 있는 아이디입니다." : "사용 가능한 아이디입니다.";
	String checkStr = check ? "false" : "true";
%>

	{
		"msg" : "<%=msg%>",
		"checkStr" : "<%=checkStr%>" 
	}
    