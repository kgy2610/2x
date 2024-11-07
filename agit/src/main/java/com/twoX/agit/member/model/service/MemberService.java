package com.twoX.agit.member.model.service;

import java.util.ArrayList;

import com.twoX.agit.member.model.vo.Parents;
import com.twoX.agit.member.model.vo.School;
import com.twoX.agit.member.model.vo.Student;
import com.twoX.agit.member.model.vo.Teacher;

public interface MemberService {
	
	// ------------------------------- 학생 -------------------------------
	//학생로그인
	Student loginStudent(Student s);

	//학생 회원가입
	int insertStudent(Student s);

	//아이디 중복찾기
	int idCheck(String checkId);
	
	// ------------------------------- 부모님 -------------------------------
	// 부모님 로그인
		Parents loginParents(Parents p);
		
	// 부모님 회원가입
	int insertParents(Parents p);
	
	// 부모님 회원가입에서 학생 아이디 검색
	ArrayList<Student> selectStudentList(Student s);
	
	// ------------------------------- 선생님 -------------------------------
	
	// 선생님 로그인
	Teacher loginTeacher(Teacher t);
	
	//선생님 회원가입
	int insertTeacher(Teacher t);

	//선생님 회원가입에서 학교 코드 검색
	ArrayList<School> searchSchoolsByName(String scName);

}
