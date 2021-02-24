package kr.or.ddit.cart.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.cart.vo.CartVO;

public interface ICartService {

	int insertBusket(CartVO cartVO);

	List<BoardVO> displayCartAll(String memId);

	int selectPoint(String memId);

	int buyCartChk(CartVO cartVO);

	int payCharge(CartVO cartVO);

	List<BoardVO> displayBuyCartAll(String memId);

	BoardVO getCart(String boardNo);

	int deleteCartChk(CartVO cartVO);





}
