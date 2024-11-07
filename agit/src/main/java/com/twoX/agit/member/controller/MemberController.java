package com.twoX.agit.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.twoX.agit.member.model.service.MemberService;
import com.twoX.agit.member.model.vo.Parents;
import com.twoX.agit.member.model.vo.Student;

@Controller
public class MemberController {
	@Autowired
	private MemberService MemberService;

	@RequestMapping("login")
    public String login() {
        return "member/login";
    }
	
	@RequestMapping("login.student")
	public String login_student() {
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
	
	@RequestMapping("enrollForm.student")
	public String enrollForm_student() {
		return "member/enrollForm_student";
	}
	
	@RequestMapping("enrollForm.teacher")
	public String enrollForm_teacher() {
		return "member/enrollForm_teacher";
	}
	
	@RequestMapping("parentsLogin")
	public ModelAndView parentsLogin(Parents p, HttpSession session, ModelAndView mv, HttpServletResponse response) {
		
		Parents loginParents = MemberService.loginParents(p);
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
	
	@RequestMapping("enroll.parents")
	public String enroll_parents(Parents p,HttpSession session, Model model) {
		System.out.print(p);
		int result = MemberService.insertParents(p);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
			return "member/login_parents";
		}
		return "member/enrollForm_teacher";
	}
	
	
	@ResponseBody
	@RequestMapping(value="child.list", produces="application/json; charset-UTF-8")
	public String ajaxSelectReplyList(String name, String phone) {
		Student s = new Student("","","",name,phone,"","","","",""); 
		ArrayList<Student> list = MemberService.selectStudentList(s);
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
	
	@RequestMapping("find_ID")
	public ModelAndView findId(Parents p, HttpSession session, ModelAndView mv, HttpServletResponse response) {
		System.out.print(p);
		Parents findId = MemberService.findId(p);
		System.out.print(findId);
		if(findId == null) { // 아이디없는 경우
			session.setAttribute("findId", p);	
		} else {
			session.setAttribute("findId", findId);
		}
		mv.setViewName("member/find_id");
		return mv;
	}
}
	

