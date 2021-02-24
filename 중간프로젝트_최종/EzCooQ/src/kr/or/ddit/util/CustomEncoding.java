package kr.or.ddit.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CustomEncoding implements Filter {

	private String encoding;
	
	@Override
	public void init(FilterConfig fc) throws ServletException {
		this.encoding = fc.getInitParameter("encoding") == null ? "utf-8" : fc.getInitParameter("encoding");
	}
	

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain fc) throws IOException, ServletException {
		req.setCharacterEncoding(encoding);
		resp.setCharacterEncoding(encoding);
		
		fc.doFilter(req, resp);
	}
	
	@Override
	public void destroy() {
		
	}
	


}
