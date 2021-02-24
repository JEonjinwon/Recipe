package kr.or.ddit.report.vo;

public class ReportVO {
	private String reportNo;
	private String reportDate;
	private String reportContent;
	private String reportCheck;
	private String reportCheckDate;
	private String reportCate;
	private String boardNo;
	private String memId;
	public String getReportNo() {
		return reportNo;
	}
	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportCheck() {
		return reportCheck;
	}
	public void setReportCheck(String reportCheck) {
		this.reportCheck = reportCheck;
	}
	public String getReportCheckDate() {
		return reportCheckDate;
	}
	public void setReportCheckDate(String reportCheckDate) {
		this.reportCheckDate = reportCheckDate;
	}
	public String getReportCate() {
		return reportCate;
	}
	public void setReportCate(String reportCate) {
		this.reportCate = reportCate;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", reportDate=" + reportDate + ", reportContent=" + reportContent
				+ ", reportCheck=" + reportCheck + ", reportCheckDate=" + reportCheckDate + ", reportCate=" + reportCate
				+ ", boardNo=" + boardNo + ", memId=" + memId + "]";
	}
	
	
	
	
}
