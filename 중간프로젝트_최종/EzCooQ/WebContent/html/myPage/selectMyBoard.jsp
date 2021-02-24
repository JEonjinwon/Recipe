<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% List<BoardVO> bvList = (List<BoardVO>) request.getAttribute("myBoardList"); %>

<%if(bvList != null){ %>
<%System.out.println("된다된다."); %>
[
	<%for(int i=0; i<bvList.size(); i++) { %>
	<%	String boardTitle = bvList.get(i).getBoardTitle(); %>
	<%	String boardDate = bvList.get(i).getBoardDate(); %>
	
	<%	if(i > 0){ %>
			,
	<%	} %>
	
		{
			"boardTitle" : "<%=boardTitle%>",
			"boardDate" : "<%=boardDate%>"
		}
		
	<%}%>
]
<%} %>