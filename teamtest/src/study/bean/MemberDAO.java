package study.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
    public int loginCheck(MemberVO vo) {
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	String sql=null;
    	
    	String inputID=vo.getId();
    	String inputPWD=vo.getPwd();
    	String DBPWD=null;
    	int result=0;
    	
    	try {
			conn=getConnection();
			sql="select pwd from study_member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputID);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
					DBPWD=rs.getString("pwd");
					
				if(inputPWD.equals(DBPWD)){
					//로그인 성공
					result=1;
				} else {
					//패스워드 틀림
					result=0;
				}//if end
				
			} else { 
				result=-1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return result;
    }
}
