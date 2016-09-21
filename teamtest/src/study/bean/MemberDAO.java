package study.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
    
    public static MemberDAO getInstance() {
        return instance;
    }
    
    private MemberDAO(){}
	public Connection getConnection() throws Exception {
		InitialContext ctx = new InitialContext(); 
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	} 
    
    public void registerMember(MemberVO vo) {
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	String sql=null;
    	
    	try {
    		conn=getConnection();
			sql="insert into study_member(ID, PWD, name, phone, location, reg_date) values(?, ?, ?, ?, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getLocation());
			pstmt.setTimestamp(6, vo.getReg_date());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    } 
}
