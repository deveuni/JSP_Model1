package com.itwillbs.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.itwillbs.member.MemberBean;


/**
 * 	예외 처리
 * 	개발자가 예측하기 어려운 에러 -> 예외(자바에서는 객체로 처리)
 * 
 * 	try{
 * 		예외가 발생할 수도 있는 코드
 * 	} catch(Exception e){
 * 		예외정보를 출력
 * 		예외 처리
 *  } finally{
 *  	예외 발생 유무와 상관없이 반드시 실행되는 코드
 * 	}
 * 
 */


public class MemberDAO {
	
	// DAO (데이터 처리 객체) -> DB처리
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	
	
	
	// 디비연결 (1, 2 단계 통합)
	/*private Connection getCon(){
		final String DRIVER="com.mysql.jdbc.Driver";
	  	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	  	final String DBID = "root";
	  	final String DBPW = "1234"; 
		
		
		// 예외처리
		try {
			//1단계
			Class.forName(DRIVER);
			System.out.println("드라이버로드 성공!");
			//2단계
			con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("디비연결 성공!"+con);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로드 실패!");
			e.printStackTrace();
			
		} catch (SQLException e) {
			System.out.println("디비연결 실패!");
			e.printStackTrace();
		}
			return con;
	}// getCon()
*/	
	
	// 1,2 단계 드라이버 로드/연결 (커넥션 풀)
	private Connection getCon(){
		
		
		try {
			// Context 객체를 생성 
			Context init = new InitialContext();
			
			// 디비 연결 정보를 불러오기 "java:comp/env/설정이름"
			// -> DataSource 타입으로 저장
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysqlDB");
			
			// ds 사용해서 연결
			con = ds.getConnection();
			
			System.out.println("연결성공! " + con);
			
			
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	
	
	
	
	
	// 자원 해제 메서드
	public void CloseDB(){
		
			try {
				
				if(rs != null){ rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	
	
	
	// 회원 가입 처리 
	public void insertMember(MemberBean mb){
		
		
		try {
			// 디비연결
			con = getCon();
			
			// 3. SQL 작성 & pstmt 생성
			
			sql = "insert into itwill_member values(?,?,?,?,?,?,?) ";
			
			pstmt = con.prepareStatement(sql);
			
			// ?
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setInt(4, mb.getAge());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getEmail());
			pstmt.setTimestamp(7, mb.getReg_date());
		
			// 4. 실행
			pstmt.executeUpdate();
			
			System.out.println("회원가입 성공!");
			
			
		} catch (SQLException e) {
			System.out.println("회원가입 실패!(SQL오류)!!");
			e.printStackTrace();
		} finally {// 가능하면 역순으로 해제하기 
			
			
			CloseDB();
			
			/*try {
				// 자원해제
			if(pstmt != null)	pstmt.close();
			if(con != null)		con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}*/
		}
	}// insertMember()
	
	
	public int idCheck(String id, String passwd){
		
		int result = -1;
		
		try {
			
			// 1,2 디비 연결
			con = getCon();
			
			
			// 3. SQL문 작성 & pstmt 객체 생성
			sql = "select pw from itwill_member where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			// 3-1 ?
			pstmt.setString(1, id);
			
			// 4. 실행 - rs
		 rs = pstmt.executeQuery();
			
			// 5. 데이터 처리 - 정수형 데이터값 사용 (1:정상처리, 0:비밀번호 오류, -1:아이디가 없음)
			if(rs.next()){ // 아이디에 해당하는 비밀번호(정보)가 있다.
				if(passwd.equals(rs.getString("pw"))){
					
					// 비밀번호 동일 => 본인 (로그인)
					System.out.println("로그인 성공!(1)");
					result = 1;
					
					// session.setAttribution(); (X) => 서블릿때 배움
					
				}else{ // 비밀번호 다름 => 비밀번호 오류
					System.out.println("비밀번호 오류!(0)");
					result = 0;
				}
				
			}else{ // 아이디에 해당하는 비밀번호(정보)가 없다.
				System.out.println("아이디 없음!(-1)");
				result = -1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	
		}finally{
			CloseDB();
		}
		
		return result;
		
	}// idCheck(id,passwd)
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public MemberBean getMember(String id){
		
		MemberBean mb = null; // 트라이구문안에 쓰믄 지역변수가 되므로 여기에 써야함.
		
		try {
			
			// 1, 2 DB 연결
			con = getCon();
			
			// 3. SQL 작성 & pstmt (select)
			sql = "select * from itwill_member where id =?";
		
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
		
			// 4. 실행 -> rs
			rs = pstmt.executeQuery();
			
			// 5. 데이터처리
			if(rs.next()){
				// DB에 있는 회원정보를 저장 -> 페이지로 전달
				mb = new MemberBean(); // 디비에 결과가 있을 때 객체 생성
		
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setGender(rs.getString("gender"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPw(rs.getString("pw"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				
				
				System.out.println("회원정보 저장완료!");
				System.out.println(mb);
			}
			
			System.out.println("구문실행 완료!");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			CloseDB();
		}
		
		return mb;
		
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public int updateMember(MemberBean mb){
		
		int result = -1;
		
		try {
			
			con = getCon();
			
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(mb.getPw().equals(rs.getString("pw"))){
					
					sql = "update itwill_member set name=?, age=?, gender=?, email=?  where id=? ";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, mb.getName());
					pstmt.setInt(2, mb.getAge());
					pstmt.setString(3, mb.getGender());
					pstmt.setString(4, mb.getEmail());
					pstmt.setString(5, mb.getId());
					
					pstmt.executeUpdate();
					
					System.out.println("정보수정완료!");
					
					result = 1;
					
				}else{ // 비밀번호 오류
					
					System.out.println("비번오류!");
					result = 0;
				}
			}else{ // 사용자가 없는 경우 
				
				System.out.println("아이디없음!");
				result = -1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			CloseDB();
		}
		
		return result;
	}
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public int deleteMember(String id, String pw){
		
		int result = -1;
		
		
		try {
			
			// 디비연결
			con = getCon();
			
			// sql 구문 & pstmt 생성
			sql = "select pw from itwill_member where id =?";
			
			
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1,id);
		
			// 실행
			rs = pstmt.executeQuery();
		
			// 데이터 처리 
		if(rs.next()){
			if(pw.equals(rs.getString("pw"))){
				
				sql = "delete from itwill_member where id =?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				pstmt.executeUpdate();
				
				System.out.println("탈퇴성공");
				
				result = 1;
				
			}else{
				System.out.println("비밀번호 오류");
				
				result = 0;
			}
			
		}else{
			System.out.println("아이디 없음");
			result = -1;
		}
		
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			CloseDB();
		}
		
		
		
		return result;
		
	}
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	//getMemberList()
	
	public ArrayList getMemberList(){
			
			// 가변길이 배열 -> 타입지정 없이는 Object로 저장 가능(모든 타입으로 저장 가능-업캐스팅)
			ArrayList memberList = new ArrayList();
			//ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		
			
			try {
				// 1,2 디비연결
				
				con = getCon();
			
			// 3. sql 작성 & pstmt 
			
				sql = "select * from itwill_member";
				
				pstmt = con.prepareStatement(sql);
				
				// 4. 실행 -> rs
				
				rs = pstmt.executeQuery();
				
				// 5. 데이터처리
				
				while(rs.next()){
					// DB테이블 결과 1행의 정보 모두를 저장 MemberBean으로 저장
					// 1명(1행) 정보를 배열 한칸에 저장
					
					MemberBean mb = new MemberBean();
					
					mb.setAge(rs.getInt("age"));
					mb.setEmail(rs.getString("email"));
					mb.setGender(rs.getString("gender"));
					mb.setId(rs.getString("id"));
					mb.setName(rs.getString("name"));
					mb.setPw(rs.getString("pw"));
					mb.setReg_date(rs.getTimestamp("reg_date"));
					////////////////////////////////
					// 회원 1명의 정보 저장 완료!(1행)
					
					// 배열 (ArrayList) 저장 
					// -> 가변길이 배열(필요시마다 배열의 크기가 증가) 					
					memberList.add(mb);
					// 배열 한 칸에 회원 1명의 정보 저장 완료 
					
					// memberList.add(3);
					// Wrapper 클래스 
					

 
					
				}// while
				
				System.out.println("정보 검색 완료");
				//System.out.println(memberList);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				CloseDB();
			}
		
		return memberList;
	}//getMemberList()
	
	
	
	
	
	
	

}//class
