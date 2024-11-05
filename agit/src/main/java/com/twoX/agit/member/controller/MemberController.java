package com.twoX.agit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	

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

}
	

