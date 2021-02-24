package kr.or.ddit.report.dao;

import java.util.List;

import kr.or.ddit.report.vo.BlackListVO;
import kr.or.ddit.report.vo.ReportVO;

public interface IReportDao {

	int report(ReportVO rv) throws Exception;

	List<ReportVO> selectReport() throws Exception;

	int forgiveReport(ReportVO rv) throws Exception;

	int black(String blackId) throws Exception;

	int blackAdd(BlackListVO bv)throws Exception;

	List<BlackListVO> selectblackListVO() throws Exception;

}
