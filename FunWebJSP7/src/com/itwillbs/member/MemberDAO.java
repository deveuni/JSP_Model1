package com.itwillbs.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	// 정보를 처리해서 데이터 베이스에 저장
	
	// 디비 연결에 필요한 변수 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = " ";
	
	
	// 디비연결
	private Connection getCon() throws Exception{
		
		//Context con = null; - 지역변수로 선언해도 return값으로 받기 때문에 메서드 외부에서도 사용 가능.
		 
		
			//Context 객체를 생성
			Context init = new InitialContext();
			

			// 디비 연결 정보를 불러오기 "java:comp/env/설정이름"
			// -> DataSource 타입으로 저장
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/funwebDB");
			
			// ds 사용해서 연결
			con = ds.getConnection();
			
			System.out.println("연결성공! " + con);
			
		return con;
		
	}
	
	
	// 자원 해제 메서드
	public void closeDB(){
		
		
			try {
				if(rs != null)	rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}// closeDB()
	
	
	// 회원가입 메서드
	public void insertMember(MemberBean mb){ //매개변수 최대 6개까지만 성능에 좋음.
	
			
			try {
				//디비연결
				 getCon();
				
				// sql & pstmt
					sql = "insert into fun_member(id,pass,name,email,birth,gender,addr,phone,mobile,reg_date) values(?,?,?,?,?,?,?,?,?,?)";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, mb.getId());
					pstmt.setString(2, mb.getPass());
					pstmt.setString(3, mb.getName());
					pstmt.setString(4, mb.getEmail());
					pstmt.setInt(5, mb.getBirth());
					pstmt.setString(6, mb.getGender());
					pstmt.setString(7, mb.getAddr());
					pstmt.setString(8, mb.getPhone());
					pstmt.setString(9, mb.getMobile());
					pstmt.setDate(10, mb.getReg_date());
					
					// 실행 
					pstmt.executeUpdate();
					
					System.out.println("회원 정보 가입 완료");
				
			} catch (Exception e) {
				e.printStackTrace();	
			}finally{
				closeDB();
			}
		}//회원가입
	
	
	
	
	
	// 중복 아이디 체크하는 메서드 - joinIdCheck(ID); - 체크를 해야하므로 리턴 필요!!
	public int joinIdCheck(String ID){
		
		int result = -1;
		
	
		try {
			// 디비연결
			getCon();
			
			// sql & pstmt
			// 전달받은 ID에 해당하는 정보가 있는지 판단 : 회원가입란에서 입력받은 id가 디비에 있는지 판단,,
			sql = "select * from fun_member where id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ID);
			
			
			// 실행
			rs = pstmt.executeQuery();
			
			// rs데이터 처리
			// 1 - 사용 가능한 아이디 
			// 0 - 사용 불가능한 아이디 
			// -1 -> 에러 발생
			
			if(rs.next()){ // 기존 데이터가 있음 => 중복 아이디
					result = 0;
				}else{ // 기존 데이터 없음 => 중복 X 아이디
					result =1;
				}
				System.out.println("아이디 중복 체크 :" + result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return result;
	}// 중복 아이디 체크하는 메서드 - joinIdCheck(ID);

	
	
	//처리필요? 정보를 가지고 페이지를 이동할 것인지,, 
	//로그인 체크 메서드 idCheck(id,pass) - 
	public int idCheck(String id, String pass){
		int result = -1;
		
		
		try {
			// 디비연결
			con = getCon();
			
			//sql(id에 해당하는 정보가 있는지 없는지 판단) & pstmt
			//아이디 비밀번호 같을 때 로그인 처리(1) 
			// 아이디 x(-1), 비밀번호x(0)
			sql = "select pass from fun_member where id=?"; // 로그인 하려면 비밀번호를 비교하기 때문에,, 비밀번호만 가져오기!!
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					result = 1; //로그인 성공
				}else{
					result = 0; // 비밀번호 오류
				}
			}else{
				result=-1; // 아이디 없음.
			}
			System.out.println("로그인 처리 완료: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return result;
	}//로그인 체크 메서드 idCheck(id,pass)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
