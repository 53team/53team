package study.hotboard.bean;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import study.util.CloseUtil;

public class HotBoardDAO {
	private static HotBoardDAO instance = new HotBoardDAO();
	public static HotBoardDAO getInstance() {
		return instance;
	} 
	
	public HotBoardDAO() {

	}

	public Connection getConnection() throws Exception {
		InitialContext ctx = new InitialContext(); 
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	} 
	
	public Vector<HotBoardVO> countCategory(){
		Connection conn=null;
    	Statement stmt=null;
    	ResultSet rs = null;
    	String sql;
    	Vector<HotBoardVO> list = new Vector<HotBoardVO>();
    	
    	HotBoardVO vo = null;
    	
    	try {
    		conn=getConnection();
    		sql = "select category, count(*) from study_room group by category order by count(*) desc";
    		stmt = conn.createStatement();
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()){
    			vo = new HotBoardVO();
    			vo.setCategory(rs.getString("category"));
    			vo.setCount(rs.getInt("count(*)"));
    			list.add(vo);
    		}
    		
    		
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		return list;
	}

	public int usercount() {
	      Connection conn = null;
	      ResultSet rs = null;
	      Statement stmt = null;
	      String sql;
	      int usercount = 0;
	      
	      try {
	         
	         conn = getConnection();
	         sql = "select count(*) from study_member ";
	         stmt = conn.createStatement();
	         rs = stmt.executeQuery(sql);
	         
	         if(rs.next()) usercount = rs.getInt(1);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         CloseUtil.close(conn);
	         CloseUtil.close(rs);
	         CloseUtil.close(stmt);
	      }
	      
	      return usercount;
	   }
}
