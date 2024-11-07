package com.twoX.agit.member.model.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoX.agit.member.model.dao.MemberDao;
import com.twoX.agit.member.model.vo.Student;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
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

}
