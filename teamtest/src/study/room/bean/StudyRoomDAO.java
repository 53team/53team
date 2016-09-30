package study.room.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import study.util.CloseUtil;

public class StudyRoomDAO {
	private static StudyRoomDAO instance = new StudyRoomDAO();
	public static StudyRoomDAO getInstance() {
		return instance;
	} 
	
	public StudyRoomDAO() {	}

	public Connection getConnection() throws Exception {
		InitialContext ctx = new InitialContext(); 
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	}
	
	public void insert(StudyRoomVO vo) {
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	String sql=null;
    	
    	try {
    		conn=getConnection();
			sql="insert into room_reg(ID, Limit) values(?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getId());
			pstmt.setInt(2, vo.getLimit());
			pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    }
	
	public void join(StudyRoomVO vo, String id){
		Connection conn=null;
    	PreparedStatement pstmt=null;
    	PreparedStatement pstmt2=null;
    	ResultSet rs = null;
    	ResultSet rs2 = null;
    	ResultSet rs3 = null;
    	String sql=null;
    	String sql2 = null;
    	String temp = "";
    	int count = 0;
    	int limit = 0;
    	HashSet<String> set = new HashSet<String>(); 
    	
    	try {
			conn = getConnection();
			
			sql = "select count, limit from room_reg where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				count = rs.getInt("count");
				limit = rs.getInt("limit");
				System.out.println("count : " + count);
				if (rs.getInt(1) == 1) {
					sql = "update room_reg set sub_id = ?, count = ? where id = ?";
					System.out.println("sub_id : " + vo.getSub_id());
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getSub_id());
					pstmt.setInt(2, count + 1);
					pstmt.setString(3, id);
					pstmt.executeUpdate();
				}
				else if(count >= limit){
					return;
				}
				else {
					sql2 = "select sub_id from room_reg where id = ?";
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, id);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						set.add(rs2.getString(1));
					}
				
					Iterator<String> i = set.iterator();
					
					while (i.hasNext()) {
						System.out.println("sub_id : " + vo.getSub_id());
						sql = "update room_reg set sub_id = ?, count = ? where id = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, (i.next() + "," + vo.getSub_id()));
						pstmt.setInt(2, count + 1);
						pstmt.setString(3, id);
						pstmt.executeUpdate();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs3);
			CloseUtil.close(rs2);
			CloseUtil.close(rs);
			CloseUtil.close(pstmt2);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	public String select(String id){
		Connection conn=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs = null;
    	String sql=null;
    	Vector vt = new Vector();
    	String result = null;
    	
    	try {
			conn = getConnection();
			sql = "select sub_id from room_reg where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				result = rs.getString(1);
				
			}
			System.out.println("sub_id : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
		return result;
	}
}
