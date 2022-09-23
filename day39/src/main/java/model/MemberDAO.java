package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll="SELECT * FROM MEMBER";
	final String sql_selectOne="SELECT * FROM MEMBER WHERE MPK=?";
	final String sql_insert="INSERT INTO MEMBER VALUES((SELECT NVL(MAX(MPK),0)+1 FROM MEMBER),?,?)";
	final String sql_update="UPDATE MEMBER SET SCORE=? WHERE MPK=?";
	final String sql_delete="DELETE MEMBER WHERE MPK=?";
	
	public ArrayList<MemberVO> selectAll(MemberVO vo) { // 전체 학생정보 반환
		ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_selectAll);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO data = new MemberVO();
				data.setMpk(rs.getInt("MPK"));
				data.setName(rs.getString("NAME"));
				data.setScore(rs.getInt("SCORE"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public MemberVO selectOne(MemberVO vo) { // 학생 1명 정보 반환
	      conn = JDBCUtil.connect();
	      ResultSet rs = null;
	      try {
	         pstmt = conn.prepareStatement(sql_selectOne);
	         pstmt.setInt(1, vo.getMpk());
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	        	 MemberVO data = new MemberVO();
	            data.setMpk(rs.getInt("MPK"));
	            data.setName(rs.getString("NAME"));
	            data.setScore(rs.getInt("SCORE"));
	            
	            return data;
	         } else {
	            return null;
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return null;
	      } finally {
	         try {
	            rs.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         JDBCUtil.disconnect(pstmt, conn);
	      }
	   }
	
	public boolean insert(MemberVO vo) { // 학생 추가
		conn = JDBCUtil.connect();
		try {		
			pstmt = conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getScore());
			int res = pstmt.executeUpdate();
			if(res<=0) {
				System.out.println("로그: 추가 실패...");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean update(MemberVO vo) { // 학생 점수 변경
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_update);
			pstmt.setInt(1,vo.getScore());
			pstmt.setInt(2,vo.getMpk());
			int res = pstmt.executeUpdate();
			if(res<=0) {
				System.out.println("로그: 수정 실패...");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean delete(MemberVO vo) { // 학생 삭제
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_delete);
			pstmt.setInt(1,vo.getMpk());
			int res = pstmt.executeUpdate();
			if(res<=0) {
				System.out.println("로그: 삭제 실패...");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
}
