package com.twoX.agit.member.model.service;

import com.twoX.agit.member.model.vo.Student;

public interface MemberService {

	//학생로그인
	Student loginStudent(Student s);

	//학생 회원가입
	int insertStudent(Student s);

	//아이디 중복찾기
	int idCheck(String checkId);

}
