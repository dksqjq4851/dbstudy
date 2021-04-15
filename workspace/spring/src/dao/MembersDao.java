package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.MembersDto;

public class MembersDao {
	//field
	
	private Connection con; //접속
	private PreparedStatement ps; // 쿼리 처리
	private ResultSet rs; // select 결과
	private String sql;
	private int result;  // insert, update, delete 결과
	
	//singleton
	//MembersDao 내부에서 1개의 객체를 미리 생성해 두고,
	//getInstance() 메소드를 통해서 외부에서 사용할 수 있도록 처리
	private MembersDao() {} // private 생성자(내부에서만 생성이 가능하다.)
	private static MembersDao dao = new MembersDao();//static : 미리 1개를 만들어 둔다.
	public static MembersDao getInstance() { //클래스 필드(static 필드)를 사용은 클래스 메소드(static 메소드)
		return dao;
	}
	//getInstance() 메소드 호출방법
	//클래스 메소드는 클래스로 호출한다.
	//MembersDao dao = MembersDao.getInstance();
	
	//method
	
	//접속과 접속해제
	//MemebersDao 내부에서만 사용하기 때문에 private 처리한다.
	private Connection getConnection() throws Exception{ //getConnection() 메소드를 호출하는 곳은 PreparedStatement 클래스를 사용하는곳으로어차피 try - catch를 하는 곳이다.
										 //getConnection() 메소드를 호출하는 곳으로 예외를 던져버리자.
		Class.forName("oracle.jdbc.driver.OracleDriver"); //ClassNoFoundException
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "spring";
		String password = "1111";
		return DriverManager.getConnection(url, user, password);//SQLExcpetion
	}
	private void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			
		
		if (rs!=null)rs.close();
		if (ps!=null)ps.close();
		if (con!=null)con.close();
	}catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
	}
		}
	//가입(DAO로 전달된 데이터를 DB에 INSERT)
	//(부가: 같은 아이디, 같은 이메일은 가입을 미리 방지)
	public int insertMembers(MembersDto dto) {//dto(mId, mName, mEmail 저장)
		result =0;
		try {
			con = getConnection(); // 커넥션은 메소드마다 열고 닫는다.
			sql = "INSERT INTO MEMBERS(MNO, MID, MNAME, MEMAIL,MDATE)" +
				  "VALUES (MEMBERS_SEQ.NEXTVAL, ?,?,?,SYSDATE)";//?자리에는 변수가 들어간다.
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getmId());//1번째 ?에 dto.getmId()를 넣는다.
			ps.setString(2, dto.getmName());
			ps.setString(3, dto.getmEmail());
			result = ps.executeUpdate(); // 실행결과는 실제 삽입된 행(row)의 개수이다.
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			close(con, ps, null);
		}
		return result;
		
	}
	public boolean doublecheck(String mId, String mEmail) {
		boolean result = false;
		try {
			con = getConnection();
			sql = "SELECT MNO FROM MEMBERS WHERE MID = ? OR MEMAIL = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, mEmail);
			rs = ps.executeQuery();
			if(!rs.next()) {
				result = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			close(con, ps, rs);
		}
		
		return result;
	}
	
	
	//탈퇴
	
	public int deleteMembers(String mId) {
		result = 0;
		try {
			con = getConnection();
			sql = "DELETE FROM MEMBERS WHERE MID = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mId);
			result = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			close(con, ps, null);
		}
		return result;
	}
	
	//회원정보수정(mId에 의한 수정)
	//수정 가능한 요소는 mName, mEmail
	public int updateMembers(MembersDto dto) {
		result = 0;
		try {
			con = getConnection();
			sql = "UPDATE MEMBERS SET MNAME = ?, MEMAIL = ? WHERE MID = ?";
			ps =con.prepareStatement(sql);
			ps.setString(1, dto.getmName());
			ps.setString(2, dto.getmEmail());
			ps.setString(3, dto.getmId());
			result = ps.executeUpdate();
			
		}catch (Exception e) {
			
			e.printStackTrace();// TODO: handle exception
		}finally {
			close(con, ps, null);
		}
		return result;
	}
	
	
	//아이디찾기
	public String findmIdBymEmail(String mEmail) {
		String findmId= null;
		try {
			con = getConnection();
			sql = "SELECT MID FROM MEMBERS WHERE MEMAIL = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mEmail);
			rs = ps.executeQuery(); // select 문은 executequery()메소드, 실행결과,resultset
			//일치한ㄴ 이메일 있으면 rs.next의 결과를 사용
			//일치하는 이메일 없으면 rs.next의 결과가 false
			if(rs.next()) {//일치하는 이메일이 있으면,.
				//rs에 저장된 칼럼의 개수 : 1개(select절의 칼럼과 일치)
				//rs.getString(1) : 1번째 칼럼의 값
				//rs.getNString("MID"): MID 칼럼의 값
				findmId = rs.getString(1);
				
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			close(con, ps, rs);
			
		}
		return findmId;
	}
	
	
	
	//회원번호에 의한 검색
	
	
	

}
