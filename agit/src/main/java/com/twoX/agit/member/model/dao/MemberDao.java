package com.twoX.agit.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.twoX.agit.member.model.vo.Parents;
import com.twoX.agit.member.model.vo.Student;

@Repository
public class MemberDao {
	public int insertParents(SqlSessionTemplate sqlSession, Parents p) {
		return sqlSession.insert("memberMapper.insertParents", p);
	}
	
	public ArrayList<Student> selectStudentList(SqlSessionTemplate sqlSession, Student s){
		return (ArrayList)sqlSession.selectList("memberMapper.selectStudentList",s);
	}
	
	public Parents loginParents(SqlSessionTemplate sqlSession, Parents p) {
		return sqlSession.selectOne("memberMapper.loginParents",p);
	}
}
