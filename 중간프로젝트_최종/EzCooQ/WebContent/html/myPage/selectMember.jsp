<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	MemberVO mv = (MemberVO) request.getAttribute("resultVO");
%>
	{
		"memId" : "<%=mv.getMemId()%>",
		"memPass" : "<%=mv.getMemPass()%>",
		"memName" : "<%=mv.getMemName()%>",
		"memTel" : "<%=mv.getMemTel()%>",
		"memMail" : "<%=mv.getMemMail()%>",
		"memGender" : "<%=mv.getMemGender()%>",
		"memBir" : "<%=mv.getMemBir()%>",
		"memPoint" : "<%=mv.getPointTotal()%>",
		"memLastPoint" : "<%=mv.getMemLastPoint()%>"
	}