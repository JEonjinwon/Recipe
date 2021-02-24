<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("getHighRankRecipe");%>

[

<%for(int i = 0; i <boardList.size(); i++){
	int boardCnt = boardList.get(i).getBoardCnt();
	String boardTitle = boardList.get(i).getBoardTitle();
	String boardNo = boardList.get(i).getBoardNo();
	String boardImg = boardList.get(i).getBoardImg();

	if(i>0) {%>
		,
  <%} %>
	
	{
		"boardCnt" : "<%=boardCnt%>"
		, "boardTitle" : "<%=boardTitle%>"
		, "boardNo" : "<%=boardNo%>"
		, "boardImg" : "<%=boardImg %>"
	}

<%} %>
	
]