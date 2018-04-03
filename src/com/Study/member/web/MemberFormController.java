package com.Study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Study.member.service.MemberServiceImpl;
import com.Study.member.vo.Member;
import com.Study.servlet.IController;

public class MemberFormController implements IController {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
		String viewPage = "/WEB-INF/view/member/memberForm.jsp";
		
		
		return viewPage;
	}

}
