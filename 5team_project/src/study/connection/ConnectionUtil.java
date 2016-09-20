package study.connection;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionUtil {
	public Connection getConnection() throws Exception{
		//연결은 JNDI & Pool 형태로 연결 객체 생성해서 리턴할 것임
		Context ctx = new InitialContext();
		DataSource  ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BoardDB");
		
		return ds.getConnection();
	}
}	
