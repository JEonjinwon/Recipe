package kr.or.ddit.cart.dao;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.cart.vo.CartVO;

public interface ICartDao {

	int insertBusket(CartVO cartVO) throws Exception;

	List<BoardVO> displayCartAll(String memId) throws Exception;

	int selectPoint(String memId) throws Exception;

	int buyCartChk(CartVO cartVO) throws Exception;

	int payCharge(CartVO cartVO) throws Exception;

	List<BoardVO> displayBuyCartAll(String memId) throws Exception;

	BoardVO getCart(String boardNo)throws Exception;

	int deleteCartChk(CartVO cartVO) throws Exception;

}
