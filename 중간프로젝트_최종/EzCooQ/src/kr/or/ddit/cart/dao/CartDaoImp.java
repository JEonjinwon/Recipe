package kr.or.ddit.cart.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class CartDaoImp implements ICartDao{

	private static ICartDao rDao;
	private SqlMapClient smc;
	
	public CartDaoImp() throws Exception{
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ICartDao getInstance()throws Exception {
		if(rDao ==null) {
			rDao=new CartDaoImp();
		}
		
		return rDao;
	}

	@Override
	public int insertBusket(CartVO cartVO) throws Exception {
		int cnt=0;
		Object obj = smc.insert("basket.insertBasket",cartVO);
		if(obj==null) {
			cnt = 1;
		}
	
	
	return cnt;
	}

	@Override
	public List<BoardVO> displayCartAll(String memId) throws SQLException {
		return smc.queryForList("basket.selectBasket",memId);
	}

	@Override
	public int selectPoint(String memId) throws Exception {
		return (int)smc.queryForObject("basket.selectPoint", memId);
	}

	@Override
	public int buyCartChk(CartVO cartVO) throws Exception {
		int chk =0;
		int addChk = smc.update("basket.addChk",cartVO);
		if(addChk>0) {
			chk=1;
		}
		
		return chk;
	}
	
	
	@Override
	public int deleteCartChk(CartVO cartVO) throws Exception {
		int chk =0;
		int addChk = smc.update("basket.deleteChk",cartVO);
		if(addChk>0) {
			chk=1;
		}
		return chk;
	}
	
	

	@Override
	public int payCharge(CartVO cartVO) throws Exception {
		int chk =0;
		int addChk = smc.update("basket.payCharge",cartVO);
		if(addChk>0) {
			chk=1;
		}
		
		return chk;
	}

	@Override
	public List<BoardVO> displayBuyCartAll(String memId) throws Exception {
		return smc.queryForList("basket.selectPayBasket",memId);
	}

	@Override
	public BoardVO getCart(String boardNo) throws Exception {
		
		BoardVO bv = (BoardVO)smc.queryForObject("basket.getCart",boardNo);
		return bv;
	}

}
