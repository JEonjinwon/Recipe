package kr.or.ddit.board.servlet;

import java.io.IOException;
import java.net.URLEncoder;

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
@WebServlet("/officalBoardDetailServelt")
public class officalBoardDetailServelt extends HttpServlet{

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			try {
				String lNameHidden = req.getParameter("lNameHidden");
				System.out.println("officalBoardDetailServelt - lNameHidden : "+ lNameHidden);
				
				// DOM Document 객체 생성
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); // DocumentBuilder 만들기위해 팩토리만듬
				DocumentBuilder builder = dbf.newDocumentBuilder();

				// XML 파일 저장
				String url = getClass().getResource("../xml/recipeAPI.xml").toString();
				Document xmlDoc = builder.parse(url);

				// DOM Document 객체로부터 루트 엘리먼트 잋 자식 객체 가져오기
				Element root = xmlDoc.getDocumentElement();

				NodeList itemHiddenList = root.getElementsByTagName("row");
				
				req.setAttribute("itemHiddenList", itemHiddenList);
				req.setAttribute("lNameHidden", lNameHidden);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("html/board/officialBoardDetail.jsp");
				dispatcher.forward(req, resp);
				
				
				

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		
		}
}
