package kr.or.ddit.cart.service;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.cart.dao.CartDaoImp;
import kr.or.ddit.cart.dao.ICartDao;
import kr.or.ddit.cart.vo.CartVO;

public class CartServiceImp implements ICartService{

	private ICartDao rDao;
	private static ICartService service;
	
	public CartServiceImp() {
		try {
			rDao = CartDaoImp.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ICartService getInstance() {
		if(service ==null) {
			service = new CartServiceImp();
		}
		return service;
	}

	@Override
	public int insertBusket(CartVO cartVO) {
		int cnt  =0;
		try {
			cnt = rDao.insertBusket(cartVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<BoardVO> displayCartAll(String memId) {
		List<BoardVO> boardList = new ArrayList<>();
		try {
			boardList = rDao.displayCartAll(memId);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public int selectPoint(String memId) {
	
		int point = 0;
		try {
			point = rDao.selectPoint(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return point;
	}

	@Override
	public int buyCartChk(CartVO cartVO) {
		int addChk=0;
		try {
			addChk =rDao.buyCartChk(cartVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addChk;
	}
	
	@Override
	public int deleteCartChk(CartVO cartVO) {
		int addChk=0;
		try {
			addChk =rDao.deleteCartChk(cartVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addChk;
	}

	@Override
	public int payCharge(CartVO cartVO) {
		int addChk=0;
		try {
			 addChk =rDao.payCharge(cartVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addChk;
	}

	@Override
	public List<BoardVO> displayBuyCartAll(String memId) {
		List<BoardVO> boardList = new ArrayList<>();
		try {
			boardList = rDao.displayBuyCartAll(memId);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public BoardVO getCart(String boardNo) {
		BoardVO bv = new BoardVO();
		
		try {
			bv = rDao.getCart(boardNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bv;
	}

	
	
}
