package kr.or.ddit.report.service;

import java.util.List;

import kr.or.ddit.report.vo.BlackListVO;
import kr.or.ddit.report.vo.ReportVO;

public interface IReportService {

	int report(ReportVO rv);

	List<ReportVO> selectReport();

	int forgiveReport(ReportVO rv);

	int black(String blackId);

	int blackAdd(BlackListVO bv);

	List<BlackListVO> selectblackListVO();

}
