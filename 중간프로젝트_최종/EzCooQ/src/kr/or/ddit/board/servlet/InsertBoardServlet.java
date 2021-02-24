package kr.or.ddit.board.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/InsertRecipe")
public class InsertBoardServlet extends HttpServlet {

   public InsertBoardServlet() {
      super();
   }

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   RequestDispatcher disp = req.getRequestDispatcher("/html/board/InsertUserForm.jsp");
	      disp.forward(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");

      String boardImg= req.getParameter("imgSrc");
      // 1. 요청 파라미터 정보 가져오기
      String boardTitle = req.getParameter("boardTitle");
      String boardContent = req.getParameter("boardContent");
      String recipeId = req.getParameter("recipeId");
      String foodId = req.getParameter("foodId");
      String memId = req.getParameter("memId");

      
      BoardVO boardVO = new BoardVO();
      
      
      IBoardService recipeService = BoardServiceImpl.getInstance();


      	 boardVO.setBoardImg(boardImg);
         boardVO.setBoardTitle(boardTitle);
         boardVO.setBoardContent(boardContent);
         boardVO.setRecipeId(recipeId);
         boardVO.setFoodId(foodId);
         boardVO.setMemId(memId);

         recipeService.insertRecipe(boardVO);

         String redirectURL = req.getContextPath() + "/ViewBoardAll";
         resp.sendRedirect(redirectURL);
      

   }
}