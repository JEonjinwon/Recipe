package kr.or.ddit.board.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import kr.or.ddit.board.vo.PagingVO;

@WebServlet("/officalBoardServlet")
public class officalBoardServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		parsing(req, resp);
		

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
	
	public void parsing(HttpServletRequest req, HttpServletResponse resp) {

		try {

			int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
			PagingVO pagingVO = new PagingVO();
			
		
			
			// DOM Document 객체 생성
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); // DocumentBuilder 만들기위해 팩토리만듬
			DocumentBuilder builder = dbf.newDocumentBuilder();

			// XML 파일 저장
			String url = getClass().getResource("../xml/recipeAPI.xml").toString();
			Document xmlDoc = builder.parse(url);

			// DOM Document 객체로부터 루트 엘리먼트 잋 자식 객체 가져오기
			Element root = xmlDoc.getDocumentElement();

			NodeList itemNodeList = root.getElementsByTagName("row");
			
			
			int totlaCount = itemNodeList.getLength();
			pagingVO.setTotalCount(totlaCount);
			pagingVO.setCurrentPageNo(pageNo);
			pagingVO.setCountPerPage(5);
			pagingVO.setPageCount(5);
			
			
			
			
			req.setAttribute("itemNodeList", itemNodeList);
			req.setAttribute("pagingVO", pagingVO);
			RequestDispatcher dispatcher = req.getRequestDispatcher("html/board/officialBoardMain.jsp");
			dispatcher.forward(req, resp);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

}
