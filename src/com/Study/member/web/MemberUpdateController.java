package com.Study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.Study.member.service.MemberServiceImpl;
import com.Study.member.vo.Member;
import com.Study.servlet.IController;

public class MemberUpdateController implements IController {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
		MemberServiceImpl memberService = new MemberServiceImpl();
		String viewPage = "/WEB-INF/view/member/memberUpdate.jsp";
		
		String mem_id = request.getParameter("mem_id");
		//아이디가 널, 비어있으면 회원목록을 리다이렉트
				if(mem_id == null || mem_id.trim().equals("")) {
					return "redirect:/member/memberList.do";
				}
				// JSP에서 useBaen, setProperty를 사용해서 파라미터를 빈에 자동으로 세팅
				//그런데 java에서는 뭘로하지? 직접 setter를 이용하는건 너무 힘들어요
				//BeanUtils -> apache에서 beanutils-1.9.3버전이랑 collections-3.2.2를 다운받음
		Member member = new Member();
		try {
			BeanUtils.populate(member, request.getParameterMap());
		} catch (Exception e) {	
			e.printStackTrace();
		}
		/*member.setMem_id(request.getParameter("mem_id"));이렇게해도됨.*/
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		String mem_email = request.getParameter("mem_email");
		
		
		member.setMem_id(mem_id);
		member.setMem_name(mem_name);
		member.setMem_phone(mem_phone);
		member.setMem_email(mem_email);
		 System.out.println(member.getMem_id());
		
		int cnt = memberService.modifyMember(member);
		System.out.println("cnt : "+cnt);
		if(cnt > 0) {
			request.setAttribute("message", "회원수정을 완료했습니다.");
		}else {
			request.setAttribute("message", "회원수정에 실패했습니다.");
		}
		

		
		return viewPage;
	}

}
