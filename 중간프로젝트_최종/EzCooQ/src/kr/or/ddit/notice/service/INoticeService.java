package kr.or.ddit.notice.service;

import java.util.List;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.notice.vo.PagingVO;

public interface INoticeService {

	public List<NoticeVO> displayAll(PagingVO pvo);

	public int selectTotalCount();

	public int insertNotice(NoticeVO noticeVO);

	public NoticeVO getNotice(int noticeNo);

	public int updateNotice(NoticeVO noticeVO);

	public int deleteNotice(int noticeNo);
	
	
	
	
	
	

	public int qnaSelectTotalCount();

	public List<NoticeVO> qnaDisplayAll(PagingVO pvo);

	public int insertQna(NoticeVO noticeVO);

	public NoticeVO getQna(int noticeNo);

	public int updateQna(NoticeVO noticeVO);

	public int deleteQna(int noticeNo);
	

}
