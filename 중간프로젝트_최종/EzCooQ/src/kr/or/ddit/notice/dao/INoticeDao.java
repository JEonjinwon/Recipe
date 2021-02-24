package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.notice.vo.PagingVO;

public interface INoticeDao {

	public int selectTotalCount() throws SQLException;

	public List<NoticeVO> displayAll(PagingVO pvo) throws SQLException;

	public int insertNotice(NoticeVO noticeVO) throws SQLException;

	public NoticeVO getNotice(int noticeNo) throws SQLException;

	public int updateNotice(NoticeVO noticeVO) throws SQLException;

	public int deleteNotice(int noticeNo) throws SQLException;

	public int qnaSelectTotalCount() throws SQLException;

	public int insertQna(NoticeVO noticeVO) throws SQLException;

	public List<NoticeVO> qnaDisplayAll(PagingVO pvo) throws SQLException;

	public NoticeVO getQna(int noticeNo) throws SQLException;

	public int updateQna(NoticeVO noticeVO) throws SQLException;

	public int deleteQna(int noticeNo) throws SQLException;

}
