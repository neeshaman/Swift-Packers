package com.SwiftPackers.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;	

public class DbConnection {
	
	private static final String urlName = "jdbc:postgresql://localhost:5432/SwiftPackers?currentSchema=public";
	private static final String driverClass = "org.postgresql.Driver";
	private static final String userName = "postgres";
	private static final String password = "admin123";
	 
	  private static Connection conn = null;

	  public static Connection getConnection() throws ClassNotFoundException, SQLException {
	    if (conn == null || conn.isClosed()) {
	      conn = createNewConnection();
	    }
	    return conn;
	  }
	  
	  private static Connection createNewConnection() throws ClassNotFoundException, SQLException {
	  Connection connection = null;
	  try {
	      Class.forName(driverClass);
	      connection = DriverManager.getConnection(urlName, userName, password);
	    } catch (ClassNotFoundException ex) {
	      System.out.println("Something is wrong with the DB connection String : " + ex.getMessage());
	    }
       return connection;
  }
}
