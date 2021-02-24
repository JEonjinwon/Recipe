package kr.or.ddit.member.vo;

public class MemberVO {
	private String memId; 		// 아이디
	private String memName; 	// 이름
	private String memPass; 	// 비번
	private String memBir; 		// 생일
	private String memGender; 	// 성별
	private String memTel; 		// 전화
	private String memMail; 	// 메일
	private String memDel; 		// 삭제여부
	private String pointTotal; 	// 총 포인트
	private String point; 		// 포인트 줄때 적어보낼꺼
	private String memLastPoint; // 마지막 획득 포인트
	
	public String getPoint() {
		return point;
	}
	public String getMemLastPoint() {
		return memLastPoint;
	}
	public void setMemLastPoint(String memLastPoint) {
		this.memLastPoint = memLastPoint;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemBir() {
		return memBir;
	}
	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public String getMemDel() {
		return memDel;
	}
	public void setMemDel(String memDel) {
		this.memDel = memDel;
	}
	public String getPointTotal() {
		return pointTotal;
	}
	public void setPointTotal(String pointTotal) {
		this.pointTotal = pointTotal;
	}
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memName=" + memName + ", memPass=" + memPass + ", memBir=" + memBir
				+ ", memGender=" + memGender + ", memTel=" + memTel + ", memMail=" + memMail + ", memDel=" + memDel
				+ ", pointTotal=" + pointTotal + "]";
	}
	
}
