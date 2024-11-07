package com.twoX.agit.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoX.agit.member.model.dao.MemberDao;
import com.twoX.agit.member.model.vo.Parents;
import com.twoX.agit.member.model.vo.School;
import com.twoX.agit.member.model.vo.Student;
import com.twoX.agit.member.model.vo.Teacher;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;

	// 학생
	@Override
	public Student loginStudent(Student s) {
		return memberDao.loginStudent(sqlSession, s);
	}

	@Override
	public int insertStudent(Student s) {
		return memberDao.insertStudent(sqlSession,s);
	}

	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession,checkId);
	}
	
	// 부모님
	@Override
	public int insertParents(Parents p) {
		return memberDao.insertParents(sqlSession, p);
	}

	@Override
	public ArrayList<Student> selectStudentList(Student s) {
		return memberDao.selectStudentList(sqlSession, s);
	}

	@Override
	public Parents loginParents(Parents p) {
		return memberDao.loginParents(sqlSession, p);
	}
	
	// 선생님
	@Override
	public Teacher loginTeacher(Teacher t) {
		return memberDao.loginTeacher(sqlSession, t);
	}

	@Override
	public int insertTeacher(Teacher t) {
		return memberDao.insertTeacher(sqlSession, t);
	}

	@Override
    public ArrayList<School> searchSchoolsByName(String scName) {
        return memberDao.selectList(sqlSession, scName);  // XML 매퍼의 id로 검색
    }

}
