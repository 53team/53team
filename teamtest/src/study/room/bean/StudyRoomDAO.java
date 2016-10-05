package study.room.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
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
    	ResultSet rs = null;
    	String sql=null;
    	
		try {
			conn = getConnection();
			sql = "insert into room_reg(num, ID, Limit) values(roomreg_num.nextVal, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getLimit());
			pstmt.executeUpdate();

			sql = "select count from room_reg where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setCount(rs.getInt("count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
    }
	
	public int join(String id, String sid, int num){
		Connection conn=null;
    	PreparedStatement pstmt=null;
    	PreparedStatement pstmt2=null;
    	PreparedStatement pstmt3=null;
    	ResultSet rs = null;
    	ResultSet rs2 = null;
    	ResultSet rs3 = null;
    	String sql=null;
    	String sql2 = null;
    	String temp = null;
    	int tempCount = 0;
    	int count = 0;
    	int limit = 0;
    	HashSet<String> set = new HashSet<String>(); 
    	
    	try {
			conn = getConnection();
			
			sql = "select count, limit from room_reg where id = ? and num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				count = rs.getInt("count");
				limit = rs.getInt("limit");
				System.out.println("count : " + count);
				
			}
			if (count == 1) {
				System.out.println("count = 1");
				sql = "update room_reg set sub_id = ?, count = ? where id = ? and num = ?";
				System.out.println("sub_id : " + sid);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sid);
				pstmt.setInt(2, count + 1);
				pstmt.setString(3, id);
				pstmt.setInt(4, num);
				pstmt.executeUpdate();
			}
			else if(count >= limit){
				System.out.println("count >= limit");
				return count;
			}
			else if(count == 2){
				System.out.println("count == 2");
				sql2 = "select sub_id from room_reg where id = ? and num = ?";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, id);
				pstmt2.setInt(2, num);
				//pstmt2.setString(2, "%"+sid+"%");
				rs2 = pstmt2.executeQuery();

				while(rs2.next()){
					temp = rs2.getString("sub_id");
				}
				if(temp.equals(sid)){
					return count;
				}
				System.out.println("sub_id : " + temp);
				sql = "update room_reg set sub_id = ?, count = ? where id = ? and num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (temp + "," + sid));
				pstmt.setInt(2, count + 1);
				pstmt.setString(3, id);
				pstmt.setInt(4, num);
				pstmt.executeUpdate();

			}
			else if((count > 2) && (count < limit)){
				System.out.println("count < limit");
				sql2 = "select sub_id from room_reg where id = ? and num = ?";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, id);
				pstmt2.setInt(2, num);
				//pstmt2.setString(2, "%"+sid+"%");
				rs2 = pstmt2.executeQuery();
				
				StringTokenizer st;
				Vector vector = new Vector();
				
				while(rs2.next()){
					temp = rs2.getString("sub_id");
				}
				st = new StringTokenizer(temp, ",");
				while(st.hasMoreTokens()){
					vector.add(st.nextToken());
				}
				for(int i = 0; i < vector.size(); i++){
					if(vector.get(i).equals(sid)){
						return count;
					}
				}

				System.out.println("sub_id : " + temp);
				sql = "update room_reg set sub_id = ?, count = ? where id = ? and num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (temp + "," + sid));
				pstmt.setInt(2, count + 1);
				pstmt.setString(3, id);
				pstmt.setInt(4, num);
				pstmt.executeUpdate();

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
    	
    	return count;
	}
	
	public String selectIds(String id, int num){
		String result = "";
		Connection conn=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs = null;
    	String sql=null;
		try{
			conn = getConnection();
			sql = "select id from room_reg where id = ? and num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getString("id");
			}
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			
			sql = "select sub_id from room_reg where id = ? and num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString("sub_id") == null){
					return result;
				}
				result = result + "," + rs.getString("sub_id");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		
		return result;
	}
	
	public List getMyRoom(StudyboardVO vo){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		List list=null;
		
		try {
			conn=getConnection();
			sql="select * from study_room where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			System.out.println("vo.getid잘 출력되는가?:"+vo.getId());
			rs=pstmt.executeQuery();
			
			System.out.println("rs값은 있는가?"+rs);
			
			list=new ArrayList();
			
			while(rs.next()){
				StudyboardVO vo2=new StudyboardVO();
				vo2.setNum(rs.getInt("num"));
				vo2.setLocation(rs.getString("location"));
				vo2.setId(rs.getString("id"));
				vo2.setTitle(rs.getString("title"));
				vo2.setLimit(rs.getInt("limit"));
				vo2.setReg_date(rs.getTimestamp("reg_date"));
				vo2.setCategory(rs.getString("category"));
				list.add(vo2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return list;
	}
	
	public List getJoinRoom(String sid){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		ResultSet rs2=null;
		String sql=null;
		List list=null;
		
		try {
			conn=getConnection();
			sql="select num from room_reg where sub_id like ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+sid+"%");

			rs=pstmt.executeQuery();
			
			System.out.println("rs값은 있는가????????"+rs);
			
			list=new ArrayList();
			
			while(rs.next()){
				sql="select * from study_room where num=?";
				pstmt2 = conn.prepareStatement(sql);
				pstmt2.setInt(1, rs.getInt("num"));
				rs2 = pstmt2.executeQuery();
				System.out.println("rs2 : " + rs2);
				while(rs2.next()){
					StudyboardVO vo2=new StudyboardVO();
					vo2.setNum(rs2.getInt("num"));
					vo2.setLocation(rs2.getString("location"));
					vo2.setId(rs2.getString("id"));
					vo2.setTitle(rs2.getString("title"));
					vo2.setLimit(rs2.getInt("limit"));
					vo2.setReg_date(rs2.getTimestamp("reg_date"));
					vo2.setCategory(rs2.getString("category"));
					list.add(vo2);
				}				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(rs2);
			CloseUtil.close(pstmt);
			CloseUtil.close(pstmt2);
			CloseUtil.close(conn);
		}
		return list;
	}
	
	public int selectCount(int num){
		int count = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		try {
			conn = getConnection();
			sql = "select count from room_reg where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
			
		return count;
	}
	
	public List countSubList(String id){
  	  Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null; 
        List list = null;
        String sql = "";
        
		try {
			conn = getConnection();
			sql = "select count from room_reg where sub_id like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+id+"%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList();

				do {
					list.add(rs.getInt("count"));
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}

		return list;
	}
	
	public List countIDList(String id){
	  	  Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null; 
	        List list = null;
	        String sql = "";
	        
			try {
				conn = getConnection();
				sql = "select count from room_reg where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					list = new ArrayList();

					do {
						list.add(rs.getInt("count"));
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseUtil.close(rs);
				CloseUtil.close(pstmt);
				CloseUtil.close(conn);
			}

			return list;
		}
}
