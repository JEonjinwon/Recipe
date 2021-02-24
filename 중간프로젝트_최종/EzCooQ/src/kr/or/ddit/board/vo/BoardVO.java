package kr.or.ddit.board.vo;

public class BoardVO {

	private String boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private String boardPrice;
	private String recipeId;
	private String foodId;
	private String memId;
	private String boardLike;
	private int boardCnt;
	private String boardImg;
	
	
	
	public String getBoardImg() {
		return boardImg;
	}
	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardPrice() {
		return boardPrice;
	}
	public void setBoardPrice(String boardPrice) {
		this.boardPrice = boardPrice;
	}
	public String getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(String recipeId) {
		this.recipeId = recipeId;
	}
	public String getFoodId() {
		return foodId;
	}
	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(String boardLike) {
		this.boardLike = boardLike;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardPrice=" + boardPrice + ", recipeId=" + recipeId + ", foodId="
				+ foodId + ", memId=" + memId + ", boardLike=" + boardLike + ", boardCnt=" + boardCnt + ", boardImg="
				+ boardImg + "]";
	}
	
	
	
}
