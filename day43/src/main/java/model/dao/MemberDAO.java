package model.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.util.JDBCUtil;
import model.vo.MemberVO;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne = "SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
	// 로그인 로직
	final String sql_insert = "INSERT INTO MEMBER VALUES(?,?,?,?)";
	final String sql_update = "UPDATE MEMBER SET MPW=?,MNAME=? WHERE MID=?";
	final String sql_delete = "DELETE FROM MEMBER WHERE MID=? AND MPW=?";
	final String sql_checkId = "SELECT * FROM MEMBER WHERE MID=?";

	public MemberVO selectOne(MemberVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_selectOne);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					MemberVO data = new MemberVO();
					data.setMid(rs.getString("MID"));
					data.setMname(rs.getString("MNAME"));
					data.setMpw(rs.getString("MPW"));
					data.setRole(rs.getString("ROLE"));
					return data;
			}
			else {
				System.out.println("로그: 비밀번호가 다릅니다.");
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}

	public boolean insert(MemberVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.setString(3, vo.getMname());
			pstmt.setString(4, vo.getRole());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	public boolean update(MemberVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_update);
			pstmt.setString(1, vo.getMpw());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	public boolean delete(MemberVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_delete);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean sample(MemberVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_checkId);
			pstmt.setString(1, vo.getMid());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("MID") != null) {
				return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
/*	public int checkId(String id) { // 유저가 입력한 값을 매개변수로 한다
		conn = JDBCUtil.connect();
		int idCheck = 0;
		try {
			pstmt = conn.prepareStatement(sql_checkId);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next() || id.equals("")) {
				idCheck = 0; // 이미 존재하는 경우, 생성 불가능
			} else {
				idCheck = 1; // 존재하지 않는 경우, 생성 가능
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return idCheck;
	} 
*/	
}
