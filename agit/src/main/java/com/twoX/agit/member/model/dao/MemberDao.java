package com.twoX.agit.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.twoX.agit.member.model.vo.Student;

@Repository
public class MemberDao {

	public Student loginStudent(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.selectOne("memberMapper.loginStudent", s);
	}

	public int insertStudent(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.insert("memberMapper.insertStudent",s);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck",checkId);
	}

}
