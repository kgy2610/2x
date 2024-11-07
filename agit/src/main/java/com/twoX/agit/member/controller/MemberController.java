package com.twoX.agit.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.twoX.agit.member.model.service.MemberService;
import com.twoX.agit.member.model.vo.Student;

@CrossOrigin
@Controller
public class MemberController {
	
	private final MemberService memberService;
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}


	@RequestMapping("login")
    public String login() {
        return "member/login";
    }
	
	@RequestMapping("login.student")
		public String login_student(Student s, HttpSession session, ModelAndView mv, String savetcId, HttpServletResponse response) {
		
		System.out.println(s.getStuId());
		System.out.println(s.getStuPwd());
		
		Student loginStudent = memberService.loginStudent(s);
		
		if(loginStudent == null) {
			 System.out.println("로그인 실패");
		}else {
			session.setAttribute("loginUser", loginStudent);
			System.out.println("로그인 성공");
			
			return "redirect:/";
		}
		return "member/login_student";
	}

	
	@RequestMapping("login.parents")
	public String login_parents() {
		return "member/login_parents";
	}
	
	@RequestMapping("login.teacher")
	public String login_teacher() {
		return "member/login_teacher";
	}
	
	@RequestMapping("find.id-pwd")
	public String find_id_pwd() {
		return "member/find_id_pwd";
	}

	@RequestMapping("enrollForm.parents")
	public String enrollForm_parents() {
		return "member/enrollForm_parents";
	}
	 
	@RequestMapping("enrollForm.stu")
	public String enrollForm_stu() {
	return "member/enrollForm_student";	
	}
	
	@RequestMapping("enrollForm.student")
	public String enrollForm_student(Student s, HttpSession session, Model model) {
		s.setPicNo("String");
		
		System.out.println(s);
	    
	    
	    int result = memberService.insertStudent(s);
	    
	    if(result > 0) {
	        session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
	        return "redirect:/";
	    } else {
	        model.addAttribute("errorMsg", "회원가입 실패");
	        return "common/errorPage"; 
	    }
	}
	
	@RequestMapping("enrollForm.teacher")
	public String enrollForm_teacher() {
		return "member/enrollForm_teacher";
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int result = memberService.idCheck(checkId);
		
		if(result > 0) {
			return "NNNNN";
		} else {
			return "NNNNY";
		}
	}

}
	

