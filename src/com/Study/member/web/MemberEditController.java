package com.Study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Study.member.service.MemberServiceImpl;
import com.Study.member.vo.Member;
import com.Study.servlet.IController;

public class MemberEditController implements IController {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		MemberServiceImpl memberService = new MemberServiceImpl();
		String viewPage = "/WEB-INF/view/member/memberEdit.jsp";
		
		String mem_id = request.getParameter("mem_id");
		System.out.println("mem_id : "+mem_id);
	//아이디가 널, 비어있으면 회원목록을 리다이렉트
			if(mem_id == null || mem_id.trim().equals("")) {
				return "redirect:/member/memberList.do";
			}
			
		Member member = memberService.getMember(mem_id);//service에 문자열 줘야되기때문에 mem_id쓴건데 별의미없음.딴걸로써도됨.
		request.setAttribute("member", member);
		
		
		return viewPage;
	}

}
