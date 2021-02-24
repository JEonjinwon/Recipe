package kr.or.ddit.cart.vo;

public class CartVO {

	private String cartNo;
	private String cartDate;
	private String memId;
	private String boardNo;
	private String payCheck;
	
	
	public String getPayCheck() {
		return payCheck;
	}
	public void setPayCheck(String payCheck) {
		this.payCheck = payCheck;
	}
	public String getCartNo() {
		return cartNo;
	}
	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}
	public String getCartDate() {
		return cartDate;
	}
	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", cartDate=" + cartDate + ", memId=" + memId + ", boardNo=" + boardNo
				+ ", payCheck=" + payCheck + ", getPayCheck()=" + getPayCheck() + ", getCartNo()=" + getCartNo()
				+ ", getCartDate()=" + getCartDate() + ", getMemId()=" + getMemId() + ", getBoardNo()=" + getBoardNo()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
}	
	
