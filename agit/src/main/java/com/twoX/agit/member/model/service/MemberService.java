package com.twoX.agit.member.model.service;

import java.util.ArrayList;

import com.twoX.agit.member.model.vo.Parents;
import com.twoX.agit.member.model.vo.Student;

public interface MemberService {
	int insertParents(Parents p);
	
	ArrayList<Student> selectStudentList(Student s);
	
	Parents loginParents(Parents p);
	
	Parents findId(Parents p);
}
