package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import util.JDBCUtil;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll = "SELECT * FROM MEMBER";
	final String sql_selectAll_F = "SELECT * FROM (SELECT * FROM MEMBER ORDER BY ROWNUM DESC) WHERE ROWNUM <=3";
	final String sql_selectOne="SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
	final String sql_insert="INSERT INTO MEMBER VALUES(?,?,?)";
	final String sql_delete="DELETE FROM MEMBER WHERE MID=? AND MPW=?";
	
	public ArrayList<MemberVO> selectAll(MemberVO mvo) { // 유지보수 용이
		conn=JDBCUtil.connect();
		ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
		try {
			pstmt = conn.prepareStatement(sql_selectAll);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO MemberVO = new MemberVO();
				MemberVO.setMid(rs.getString("MID"));
				MemberVO.setMpw(rs.getString("MPW"));
				MemberVO.setMname(rs.getString("MNAME"));
				datas.add(MemberVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public ArrayList<MemberVO> selectAll_F(MemberVO mvo) { // 유지보수 용이
		conn=JDBCUtil.connect();
		ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
		try {
			pstmt = conn.prepareStatement(sql_selectAll_F);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO MemberVO = new MemberVO();
				MemberVO.setMid(rs.getString("MID"));
				MemberVO.setMpw(rs.getString("MPW"));
				MemberVO.setMname(rs.getString("MNAME"));
				datas.add(MemberVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public MemberVO selectOne(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				MemberVO data=new MemberVO();
				data.setMid(rs.getString("MID"));
				data.setMname(rs.getString("MNAME"));
				data.setMpw(rs.getString("MPW"));
				return data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	public boolean insert(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.setString(3, vo.getMname());
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
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
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
}
