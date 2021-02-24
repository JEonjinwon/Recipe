package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.notice.vo.PagingVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class NoticeDaoImpl implements INoticeDao{
	private static INoticeDao noticeDao;
	
	private SqlMapClient smc;
	
	private NoticeDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static INoticeDao getInstance() {
		if(noticeDao == null) {
			noticeDao = new NoticeDaoImpl();
		}
		return noticeDao;
	}

	@Override
	public int selectTotalCount() throws SQLException {
		int totalCount = (int) smc.queryForObject("notice.selectTotalCount");
		return totalCount;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<NoticeVO> displayAll(PagingVO pvo) throws SQLException {
		List<NoticeVO> noticeList = new ArrayList<>();
		noticeList = (List<NoticeVO>)smc.queryForList("notice.displayAll", pvo);
		return noticeList;
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("notice.insertNotice", noticeVO);
		
		if(obj == null) {
			cnt = 0;
		}
		return cnt;
	}

	@Override
	public NoticeVO getNotice(int noticeNo) throws SQLException {
		NoticeVO noticeVO = (NoticeVO)smc.queryForObject("notice.getNotice", noticeNo);
		return noticeVO;
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) throws SQLException {
		int cnt = smc.update("notice.updateNotice", noticeVO);
		return cnt;
		
	}

	@Override
	public int deleteNotice(int noticeNo) throws SQLException {
		int cnt = smc.delete("notice.deleteNotice", noticeNo);
		return cnt;
	}

	@Override
	public int qnaSelectTotalCount() throws SQLException {
		int totalCount = (int) smc.queryForObject("notice.qnaSelectTotalCount");
		return totalCount;
	}

	@Override
	public int insertQna(NoticeVO noticeVO) throws SQLException{
		int cnt = 0;
		Object obj = smc.insert("notice.insertQna", noticeVO);
		
		if(obj == null) {
			cnt = 0;
		}
		return cnt;
	}

	@Override
	public List<NoticeVO> qnaDisplayAll(PagingVO pvo) throws SQLException {
		List<NoticeVO> noticeList = new ArrayList<>();
		noticeList = (List<NoticeVO>)smc.queryForList("notice.qnaDisplayAll", pvo);
		return noticeList;
	}

	@Override
	public NoticeVO getQna(int noticeNo) throws SQLException{
		NoticeVO noticeVO = (NoticeVO)smc.queryForObject("notice.getQna", noticeNo);
		return noticeVO;
	}

	@Override
	public int updateQna(NoticeVO noticeVO) throws SQLException {
		int cnt = smc.update("notice.updateQna", noticeVO);
		return cnt;
	}

	@Override
	public int deleteQna(int noticeNo) throws SQLException {
		int cnt = smc.delete("notice.deleteQna", noticeNo);
		return cnt;
	}
}
