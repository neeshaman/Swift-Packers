package com.SwiftPackers.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.util.DbConnection;


public class AdminHomeServlet extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		RequestDispatcher rd=null;
		
		//total delivery counting
		Connection conn=null;
		Statement stmt=null,stmt1=null,stmt2=null;
		ResultSet rs=null,rs1=null,rs2=null;
		
		try
		{
			conn=DbConnection.getConnection();
			
			stmt=conn.createStatement();
			stmt1=conn.createStatement();
			stmt2=conn.createStatement();
			
			String dselectQ = "select count(*) from public.haulage where delivery_status='delivered'";
			String orderselectQ= "select count(*) from public.haulage";
			String userselectQ= "select count(*) from public.user";
			
			System.out.println(dselectQ);
			System.out.println(orderselectQ);
			System.out.println(userselectQ);
			
			rs = stmt.executeQuery(dselectQ);
			rs1 = stmt1.executeQuery(orderselectQ);
			rs2 = stmt2.executeQuery(userselectQ);
			
			if(rs.next())
			{
				request.setAttribute("DeliveryCount",rs.getString("count"));
				System.out.println("in deliverycount");
				
			}
			if(rs1.next())
			{
				request.setAttribute("OrderCount",rs1.getString("count"));
				System.out.println("in ordercount");
			}
			if(rs2.next())
			{
				request.setAttribute("UserCount",rs2.getString("count"));
				System.out.println("in usercount");
			}
			System.out.println("Sending response to AdminHome");
			rd=request.getRequestDispatcher("AdminHome.jsp");
			rd.forward(request, response);
			
		}
		catch(Exception e)
		{
			System.out.println("error in delivery count"+e);
		}
	}
}
