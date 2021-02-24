package kr.or.ddit.notice.service;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.notice.vo.PagingVO;

public class NoticeServiceImpl implements INoticeService {
	private INoticeDao noticeDao = NoticeDaoImpl.getInstance();
	private static INoticeService noticeService;
	
	public static INoticeService getInstance() {
		if(noticeService == null) {
			noticeService = new NoticeServiceImpl();
		}
		return noticeService;
	}

	@Override
	public List<NoticeVO> displayAll(PagingVO pvo) {
		List<NoticeVO> noticeList = new ArrayList<>();
		try {
			noticeList = noticeDao.displayAll(pvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeList;
	}

	@Override
	public int selectTotalCount() {
		int cnt = 0;
		try {
			cnt = noticeDao.selectTotalCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		int cnt = 0;
		try {
			cnt = noticeDao.insertNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public NoticeVO getNotice(int noticeNo) {
		NoticeVO noticeVO = null;
		
		try {
			noticeVO = noticeDao.getNotice(noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeVO;
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		int cnt = 0;
		try {
			cnt = noticeDao.updateNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int cnt = 0;
		try {
			cnt = noticeDao.deleteNotice(noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int qnaSelectTotalCount() {
		int cnt = 0;
		try {
			cnt = noticeDao.qnaSelectTotalCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<NoticeVO> qnaDisplayAll(PagingVO pvo) {
		List<NoticeVO> noticeList = new ArrayList<>();
		try {
			noticeList = noticeDao.qnaDisplayAll(pvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeList;
	}

	@Override
	public int insertQna(NoticeVO noticeVO) {
		int cnt = 0;
		try {
			cnt = noticeDao.insertQna(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public NoticeVO getQna(int noticeNo) {
		NoticeVO noticeVO = null;
		try {
			noticeVO = noticeDao.getQna(noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeVO;
	}

	@Override
	public int updateQna(NoticeVO noticeVO) {
		int cnt = 0;
		try {
			cnt = noticeDao.updateQna(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteQna(int noticeNo) {
		int cnt = 0;
		try {
			cnt = noticeDao.deleteQna(noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
}
