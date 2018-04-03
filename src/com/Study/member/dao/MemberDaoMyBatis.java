package com.Study.member.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Study.member.vo.Member;
import com.Study.util.MyBatisFactory;

public class MemberDaoMyBatis implements IMemberDao {

	private String namespace = "com.Study.member.dao.IMemberDao.";
	
	@Override
	public List<Member> getMemberList(Connection conn) throws SQLException {
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		
		try {
			//Dao 구현체를 생성하지 않고, 서비스단에서 바로 MyBatis 객체를 이용
			IMemberDao memberDao = session.getMapper(IMemberDao.class);
			List<Member> list = memberDao.getMemberList( conn );
			/*List<Member> list = session.selectList( namespace + "getMemberList");*/
			return list;
		} finally {
			session.close();
		}
		
	}

	@Override
	public Member getMember(Connection conn, String mem_id) throws SQLException {
		SqlSession session = MyBatisFactory.getSqlSession().openSession(); /*커넥션 실행 맵핑 마무리..*/
		
		try {
			Member member = session.selectOne( namespace + "getMember",mem_id );
			return member;
			/*return session.selectOne("com.Study.member.dao.IMemberDao.getMember",mem_id ); 이렇게 한줄로 해도 됨.*/
		} finally {
			session.close();
		}
		
	}

	@Override
	public int insertMember(Connection conn, Member member) throws SQLException {
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		
		try {
			int cnt = session.update( namespace + "insertMember", member );
			return cnt;
	
		} finally {
			session.close();
		}
	}
	

	@Override
	public int updateMember(Connection conn, Member member) throws SQLException {
		SqlSession session = MyBatisFactory.getSqlSession().openSession(); 
		//int cnt = session.update에 update를 쓰든 delete를 쓰든 같음. executeUpdate로 감 다들 select빼고~
		try {
			int cnt = session.update( namespace + "updateMember", member );
			session.commit();
			return cnt;
	
		} finally {
			session.close();
		}
	}

	@Override
	public int deleteMember(Connection conn, Member member) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
