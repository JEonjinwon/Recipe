package kr.or.ddit.notice.vo;

public class NoticeVO {
	private int noticeNo;
	private String noticeDate;
	private String noticeTitle;
	private String noticeContent;
	private String noticeCate;
	
	public String getNoticeCate() {
		return noticeCate;
	}
	public void setNoticeCate(String noticeCate) {
		this.noticeCate = noticeCate;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
}
