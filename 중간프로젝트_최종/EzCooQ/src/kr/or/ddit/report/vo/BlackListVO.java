package kr.or.ddit.report.vo;

public class BlackListVO {
private String memId    ;
private String bReason  ;
private String bDate    ;
public String getMemId() {
	return memId;
}
public void setMemId(String memId) {
	this.memId = memId;
}
public String getbReason() {
	return bReason;
}
public void setbReason(String bReason) {
	this.bReason = bReason;
}
public String getbDate() {
	return bDate;
}
public void setbDate(String bDate) {
	this.bDate = bDate;
}
@Override
public String toString() {
	return "BlackListVO [memId=" + memId + ", bReason=" + bReason + ", bDate=" + bDate + "]";
}

	



	
}
