package com.twoX.agit.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoX.agit.member.model.dao.MemberDao;
import com.twoX.agit.member.model.vo.Parents;
import com.twoX.agit.member.model.vo.Student;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
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

}
