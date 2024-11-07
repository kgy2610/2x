package com.twoX.agit.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.twoX.agit.member.model.service.MemberService;
import com.twoX.agit.member.model.vo.Parents;
import com.twoX.agit.member.model.vo.School;
import com.twoX.agit.member.model.vo.Student;
import com.twoX.agit.member.model.vo.Teacher;

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
	
	// ------------------------------ 학생 ------------------------------
	// 학생 로그인
	@RequestMapping("login.student")
	public String login_student(Student s, HttpSession session, ModelAndView mv, String savetcId,
			HttpServletResponse response) {

		System.out.println(s.getStuId());
		System.out.println(s.getStuPwd());

		Student loginStudent = memberService.loginStudent(s);

		if (loginStudent == null) {
			System.out.println("로그인 실패");
		} else {
			session.setAttribute("loginUser", loginStudent);
			System.out.println("로그인 성공");

			return "redirect:/";
		}
		return "member/login_student";
	}
	
	// 학생 회원가입 창으로 이동
	@RequestMapping("enrollForm.stu")
		public String enrollForm_stu() {
			return "member/enrollForm_student";
	}

	// 학생 회원가입
	@RequestMapping("enrollForm.student")
	public String enrollForm_student(Student s, HttpSession session, Model model) {
		s.setPicNo("String");

		System.out.println(s);

		int result = memberService.insertStudent(s);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}

	// ------------------------------ 부모님 ------------------------------
	@RequestMapping("login.parents")
	public String login_parents() {
		return "member/login_parents";
	}
	
	// 부모님 로그인
	@RequestMapping("parentsLogin")
	public ModelAndView parentsLogin(Parents p, HttpSession session, ModelAndView mv, HttpServletResponse response) {
		
		Parents loginParents = memberService.loginParents(p);
		System.out.println(p);
		if(loginParents == null) { // 아이디없는 경우
			mv.addObject("errorMsg", "일치하는 아이디를 찾을 수 없습니다.");
			mv.setViewName("common/errorPage");
		} else {
			session.setAttribute("loginUser", loginParents);
			mv.setViewName("redirect:/");
		}
		return mv;
	}

	@RequestMapping("enrollForm.parents")
	public String enroll_parents() {
		return "member/enrollForm_parents";
	}
	
	// 학부모 회원가입
	@RequestMapping("enroll.parents")
	public String enroll_parents(Parents p,HttpSession session, Model model) {
		System.out.print(p);
		int result = memberService.insertParents(p);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
			return "member/login_parents";
		}
		return "member/enrollForm_teacher";
	}

	// 자녀 아이디 검색
	@ResponseBody
	@RequestMapping(value="child.list", produces="application/json; charset-UTF-8")
	public String ajaxSelectReplyList(String name, String phone) {
		Student s = new Student("","","",name,phone,"","","","",""); 
		ArrayList<Student> list = memberService.selectStudentList(s);
		for (Student st : list) {
			if(st.getClassCode()==null) {
				st.setClassCode("아직반이배정되지않았습니다");
			}else {
				try {
					st.setClassCode(Integer.parseInt(st.getClassCode().substring(st.getClassCode().length()-2))+"반 / "+st.getStuNum()+"번");
				}catch (NumberFormatException e) {
					st.setClassCode(st.getClassCode().substring(st.getClassCode().length()-2)+"반 / "+st.getStuNum()+"번");
				}
				
			}			
		}
		return new Gson().toJson(list);
	}

	// ------------------------------ 선생님 ------------------------------
	// 선생님 로그인
	@RequestMapping("login.teacher")
	public String login_teacher(Teacher t, HttpSession session, ModelAndView mv, String savetcId, HttpServletResponse response) {
		System.out.println(t.getTcId());
		System.out.println(t.getTcPwd());

		Teacher loginTeacher = memberService.loginTeacher(t);

		if (loginTeacher == null) {
			System.out.println("로그인 실패");
		} else {
			session.setAttribute("loginUser", loginTeacher);
			System.out.println("로그인 성공");

			return "redirect:/";
		}
		return "member/login_teacher";
	}
	
	// 선생님 회원가입 창으로 이동
	@RequestMapping("enrollForm.tea")
	public String enrollForm_tea() {
		return "member/enrollForm_teacher";
	}

	// 선생님 회원가입
	@RequestMapping("enrollForm.teacher")
	public String enrollForm_teacher(Teacher t, HttpSession session, Model model) {
		System.out.println(t);

		int result = memberService.insertTeacher(t);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}

	// 선생님 회원가입 학교 검색(학교코드 불러오기)
	@ResponseBody
	@RequestMapping(value = "searchSchool.list", produces = "application/json; charset-UTF-8")
	public String ajaxSelectReplyList(String scName) {
		ArrayList<School> list = memberService.searchSchoolsByName(scName);
		System.out.println(list);
		return new Gson().toJson(list);
	}

	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int result = memberService.idCheck(checkId);

		if (result > 0) {
			return "NNNNN";
		} else {
			return "NNNNY";
		}
	}
}