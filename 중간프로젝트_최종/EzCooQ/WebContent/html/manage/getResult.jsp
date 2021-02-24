<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<MemberVO> memberList = (List<MemberVO>)request.getAttribute("displayAll"); 
%>
[
<%for(int i = 0; i <memberList.size(); i++){
	String memId = memberList.get(i).getMemId();
	String memName = memberList.get(i).getMemName();
	String memPass = memberList.get(i).getMemPass();
	String memBir = memberList.get(i).getMemBir().substring(0, 10);
	String memGender = memberList.get(i).getMemGender();
	String memTel = memberList.get(i).getMemTel();
	String memMail = memberList.get(i).getMemMail();
	String pointTotal = memberList.get(i).getPointTotal();
	if(i>0) {%>
		,
  <%} %>
	{"memId" : "<%=memId %>"
	, "memName" : "<%=memName%>"
	, "memPass" : "<%=memPass%>"
	, "memBir" : "<%=memBir%>"
	, "memGender" : "<%=memGender%>"
	, "memTel" : "<%=memTel%>"
	, "memMail" : "<%=memMail%>"
	, "pointTotal" : "<%=pointTotal %>"
	}
  <%} %>
	
]