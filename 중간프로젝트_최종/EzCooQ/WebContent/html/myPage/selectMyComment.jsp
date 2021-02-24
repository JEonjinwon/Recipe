<%@page import="kr.or.ddit.comment_board.vo.CommentBoardVO"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% List<CommentBoardVO> cvList = (List<CommentBoardVO>) request.getAttribute("myCommentList"); %>

<%if(cvList != null){ %>
[
	<%for(int i=0; i<cvList.size(); i++) { %>
	<%	String comStar  = cvList.get(i).getComStar(); %>
	<%	String comContent = cvList.get(i).getComContent(); %>
	<%	String comDate = cvList.get(i).getComDate(); %>
	
	<%	if(i > 0){ %>
			,
	<%	} %>
	
		{
			"comStar" : "<%=comStar%>",
			"comContent" : "<%=comContent%>",
			"comDate" : "<%=comDate%>"
		}
		
	<%}%>
]
<%} %>