package com.twoX.agit.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.twoX.agit.member.model.vo.Parents;
import com.twoX.agit.member.model.vo.School;
import com.twoX.agit.member.model.vo.Student;
import com.twoX.agit.member.model.vo.Teacher;

@Repository
public class MemberDao {

	//학생 로그인
	public Student loginStudent(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.selectOne("memberMapper.loginStudent", s);
	}

	//학생 회원가입
	public int insertStudent(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.insert("memberMapper.insertStudent",s);
	}

	//부모님 로그인
	public Parents loginParents(SqlSessionTemplate sqlSession, Parents p) {
		return sqlSession.selectOne("memberMapper.loginParents",p);
	}
	
	// 부모님 회원가입
	public int insertParents(SqlSessionTemplate sqlSession, Parents p) {
		return sqlSession.insert("memberMapper.insertParents", p);
	}
		
	// 부모님 회원가입에서 자녀 아이디 찾기
	public ArrayList<Student> selectStudentList(SqlSessionTemplate sqlSession, Student s){
		return (ArrayList)sqlSession.selectList("memberMapper.selectStudentList",s);
	}
	
	// 선생님 로그인
	public Teacher loginTeacher(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.selectOne("memberMapper.loginTeacher", t);
	}
	
	// 선생님 회원가입
	public int insertTeacher(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.insert("memberMapper.insertTeacher", t);
	}
	
	// 선생님 회원가입에서 학교코드 찾기
	public ArrayList<School> selectList(SqlSessionTemplate sqlSession, String scName) {
		return (ArrayList)sqlSession.selectList("schoolMapper.searchSchoolsByName", scName);
		}

	// 아이디 중복 체크
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck",checkId);
	}
}
