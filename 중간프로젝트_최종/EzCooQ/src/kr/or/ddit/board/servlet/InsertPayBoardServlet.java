package kr.or.ddit.board.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/InsertPayRecipe")
public class InsertPayBoardServlet extends HttpServlet {

  

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   RequestDispatcher disp = req.getRequestDispatcher("/html/board/InsertPayForm.jsp");
	   disp.forward(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");


      // 1. 요청 파라미터 정보 가져오기
      // String boardNo = req.getParameter("boardNo");
      String boardImg= req.getParameter("imgSrc");
      System.out.println("boardImg");
      String boardTitle = req.getParameter("boardTitle");
      String boardContent = req.getParameter("boardContent");
      // String boardDate = req.getParameter("boardDate");
      // String boardLike = req.getParameter("boardLike");
      String recipeId = req.getParameter("recipeId");
      String foodId = req.getParameter("foodId");
      String memId = req.getParameter("memId");
      String recipePay = req.getParameter("recipePay");

      BoardVO boardVO = new BoardVO();

      IBoardService recipeService = BoardServiceImpl.getInstance();

      System.out.println("recipePay :  " + recipePay);

    
         boardVO.setBoardTitle(boardTitle);
         boardVO.setBoardContent(boardContent);
         boardVO.setRecipeId(recipeId);
         boardVO.setFoodId(foodId);
         boardVO.setMemId(memId);
         boardVO.setBoardPrice(recipePay);
         boardVO.setBoardImg(boardImg);

         recipeService.insertRecipe(boardVO);

         String redirectURL = req.getContextPath() + "/SelectPayBoardServlet";
         resp.sendRedirect(redirectURL);

      

   }
}