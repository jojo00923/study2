package com.Study.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Study.member.vo.Member;

public class MemberDaoJDBC implements IMemberDao {
	//인터페이스
	// - 객체의 사용방법을 정의한 타입
	// 자바 인터페이스
	
	// 회원목록
	/* (non-Javadoc)
	 * @see com.Study.member.dao.IMemberDao#getMemberList(java.sql.Connection)
	 */
	@Override
	public List<Member> getMemberList(Connection conn) throws SQLException { //throws SQLException 이건 써야 할지 말아야 할지 살짝 논쟁이 있는듯ㅎㅎㅎ]
		//셀렉트 문은 리턴값이 ResultSet이지만 List<Member>을 사용하는 이유는 클로즈를 해줄수가 없어서 리스트에 값을 담아주고 클로즈를 한다
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Member> list = new ArrayList<>(); // getMemberList의 반환되는 값을 넣어줄 List
		StringBuffer query = new StringBuffer(); // 빌더와 버퍼 차이 거의 없음 쪼~끔 달라졌다 
		
		query.append(" select 			");
		query.append(" 		mem_id		");
		query.append(" 		,mem_name   ");
		query.append(" 		,mem_pwd    ");
		query.append(" 		,mem_phone  ");
		query.append(" 		,mem_email  ");
		query.append(" 		,to_char(reg_date, 'YYYY/MM/DD') as reg_date  ");
		query.append(" from tb_member1  	");
		query.append(" order by reg_date DESC  ");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			Member member = null;		
			while (rs.next()) {
				member = new Member(); //새로운 걸 담게됨.
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_pwd(rs.getString("mem_pwd"));
				member.setMem_phone(rs.getString("mem_phone"));
				member.setMem_email(rs.getString("mem_email"));
				member.setReg_date(rs.getString("reg_date"));
				list.add(member); //리스트에 저장
			}
			return list;
		} finally {
			if(rs != null) try {rs.close();}catch(Exception e){};
			if(pstmt != null) try {pstmt.close();}catch(Exception e){};
		}
	}
	
	//회원상세
	/* (non-Javadoc)
	 * @see com.Study.member.dao.IMemberDao#getMember(java.sql.Connection, java.lang.String)
	 */
	@Override
	public Member getMember(Connection conn, String mem_id) throws SQLException {
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			StringBuffer query = new StringBuffer(); // 빌더와 버퍼 차이 거의 없음 쪼~끔 달라졌다 
			
			query.append(" select 			");
			query.append(" 		mem_id		");
			query.append(" 		,mem_name   ");
			query.append(" 		,mem_pwd    ");
			query.append(" 		,mem_phone  ");
			query.append(" 		,mem_email  ");
			query.append(" 		,to_char(reg_date, 'YYYY/MM/DD HH24:MI') as reg_date  ");
			query.append(" from tb_member1  	");
			query.append(" where mem_id = ?  	");
			
			try {
				pstmt = conn.prepareStatement(query.toString());//toString을 씀으로써 그거에 대한 내용이 나옴. query만 쓰면 주소값?이 나옴.
				/*pstmt를 쓰려면 connection의 인스턴스 변수 conn에 있는 prepareStatement라는 메서드를 선언해줘야됨.*/
				pstmt.setString(1, mem_id); //위 ?에 뭘 넣을건지 세팅
				rs = pstmt.executeQuery();
				Member member = null;		
				if (rs.next()) {
					member = new Member(); //새로운 걸 담게됨.
					member.setMem_id(rs.getString("mem_id"));
					member.setMem_name(rs.getString("mem_name"));
					member.setMem_phone(rs.getString("mem_phone"));
					member.setMem_email(rs.getString("mem_email"));
					member.setReg_date(rs.getString("reg_date"));
				}
				return member;
			} finally {
				if(rs != null) try {rs.close();}catch(Exception e){};
				if(pstmt != null) try {pstmt.close();}catch(Exception e){};
			}
		}	
	
	// 회원등록
	/* (non-Javadoc)
	 * @see com.Study.member.dao.IMemberDao#insertMember(java.sql.Connection, com.Study.member.vo.Member)
	 */
	@Override
	public int insertMember(Connection conn, Member member) throws SQLException {
		
		PreparedStatement pstmt = null;
		StringBuffer query = new StringBuffer(); 
		
		query.append(" INSERT INTO tb_member1 ( ");
		query.append("        mem_id      ");
		query.append("      , mem_name    ");
		query.append("      , mem_pwd     ");
		query.append("      , mem_phone   ");
		query.append("      , mem_email   ");
		query.append("      , reg_date    ");
		query.append(" 			)         ");
		query.append(" values 	(         ");
		query.append(" 			?		  ");
		query.append(" 			,?		  ");
		query.append(" 			,?		  ");
		query.append(" 			,?		  ");
		query.append(" 			,?		  ");
		query.append(" 			,sysdate  ");
		query.append(" 			)		  ");
		
		System.out.println(query);
		
		int id = 1;
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(id++, member.getMem_id());
			pstmt.setString(id++, member.getMem_name());
			pstmt.setString(id++, member.getMem_pwd());
			pstmt.setString(id++, member.getMem_phone());
			pstmt.setString(id++, member.getMem_email());
			int cnt = pstmt.executeUpdate();
			return cnt;
		} finally {
			if(pstmt != null) try {pstmt.close();}catch(Exception e){};
		}
	}
	
	// 회원수정
	/* (non-Javadoc)
	 * @see com.Study.member.dao.IMemberDao#updateMember(java.sql.Connection, com.Study.member.vo.Member)
	 */
	@Override
	public int updateMember(Connection conn, Member member) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer query = new StringBuffer(); // 빌더와 버퍼 차이 거의 없음 쪼~끔 달라졌다 
		
		query.append(" UPDATE tb_member1    ");
		query.append( "   SET mem_name = ?  ");
		query.append( "     , mem_phone = ? ");
		query.append( "     , mem_email = ? ");
		query.append( " WHERE mem_id = ?    ");  
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			// 구문객체 생성후 파라미터 설정
			pstmt.setString(1, member.getMem_name());
			pstmt.setString(2, member.getMem_phone());
			pstmt.setString(3, member.getMem_email());
			pstmt.setString(4, member.getMem_id());
			
			int cnt = pstmt.executeUpdate();
			return cnt;
		} finally {
			if(rs != null) try {rs.close();}catch(Exception e){};
			if(pstmt != null) try {pstmt.close();}catch(Exception e){};
		}
	}
		
	// 회원삭제
		/* (non-Javadoc)
		 * @see com.Study.member.dao.IMemberDao#deleteMember(java.sql.Connection, com.Study.member.vo.Member)
		 */
		@Override
		public int deleteMember(Connection conn, Member member) throws SQLException {
			
			PreparedStatement pstmt = null;
			
			StringBuffer query = new StringBuffer(); // 빌더와 버퍼 차이 거의 없음 쪼~끔 달라졌다 
			
			query.append(" delete from tb_member1    ");
			query.append( " WHERE mem_id = ?    ");  
			
			try {
				pstmt = conn.prepareStatement(query.toString());
				// 구문객체 생성후 파라미터 설정
				pstmt.setString(1, member.getMem_id());
				
				int cnt = pstmt.executeUpdate();
				return cnt;
			} finally {
				if(pstmt != null) try {pstmt.close();}catch(Exception e){};
			}
		
		
	}
	
	
	
	
	
}









