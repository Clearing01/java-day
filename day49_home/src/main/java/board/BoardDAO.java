package board;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll = "SELECT * FROM (SELECT * FROM BOARD ORDER BY BID DESC) WHERE ROWNUM <=?";
		// LIMIT 은 MySQL
		// Oracle 은 ROWNUM 을 사용함 (※ SQL문 실행순서 유의!)
	final String sql_selectAll_R="SELECT * FROM REPLY WHERE BID=? ORDER BY RID DESC";
	final String sql_insert ="INSERT INTO BOARD(BID,MID,MSG) VALUES((SELECT NVL(MAX(BID),0)+1 FROM BOARD),?,?)";
	final String sql_insert_R="INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),?,?,?)";
	final String sql_delete="DELETE FROM BOARD WHERE BID=?";
	final String sql_delete_R="DELETE FROM REPLY WHERE RID=?";
	final String sql_update="UPDATE BOARD SET FAVCNT=FAVCNT+1 WHERE BID=?";
	
	public ArrayList<BoardSet> selectAll(BoardVO bvo) { // 유지보수 용이
		conn=JDBCUtil.connect();
		ArrayList<BoardSet> datas = new ArrayList<BoardSet>();
		try {
			pstmt = conn.prepareStatement(sql_selectAll);
			pstmt.setInt(1, bvo.getCnt());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardSet bs = new BoardSet();
				
				BoardVO boardVO = new BoardVO();
				boardVO.setBid(rs.getInt("BID"));
				boardVO.setFavcnt(rs.getInt("FAVCNT"));
				boardVO.setMid(rs.getString("MID"));
				boardVO.setMsg(rs.getString("MSG"));
				
				
				ArrayList<ReplyVO> rList = new ArrayList<ReplyVO>();
				pstmt=conn.prepareStatement(sql_selectAll_R);
				pstmt.setInt(1, rs.getInt("BID"));
				ResultSet rs2 = pstmt.executeQuery();
				while(rs2.next()) {
					ReplyVO replyVO = new ReplyVO();
					
					replyVO.setBid(rs2.getInt("BID"));
					replyVO.setMid(rs2.getString("MID"));
					replyVO.setRid(rs2.getInt("RID"));
					replyVO.setRmsg(rs2.getString("RMSG"));
					
					rList.add(replyVO);
				}
				bs.setrList(rList);
				
				boardVO.setRcnt(rList.size()); 
				// rList.size()와 RCNT가 같아 변수를 추가하지 않아 서버비용을 줄일 수 있음
				bs.setBoardVO(boardVO);
				
				datas.add(bs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public boolean insert(BoardVO bvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, bvo.getMid());
			pstmt.setString(2, bvo.getMsg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean insert_R(ReplyVO rvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert_R);
			pstmt.setString(1, rvo.getMid());
			pstmt.setInt(2, rvo.getBid());
			pstmt.setString(3, rvo.getRmsg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean update(BoardVO bvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setInt(1, bvo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	public boolean delete(BoardVO bvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1,bvo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean delete_R(ReplyVO rvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete_R);
			pstmt.setInt(1,rvo.getRid());
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
