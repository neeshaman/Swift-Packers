package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SwiftPackers.bean.UserBean;
import com.SwiftPackers.dao.UserDao;

public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		
		boolean isError = false;
		boolean isAdmin = false;
		if (password.trim().length() == 0) {
			isError = true;
			request.setAttribute("PasswordError", "<font color='red'>Please Enter Password</font>");
		} else if (password.trim().length() < 8) {	
			isError = true;
			request.setAttribute("PasswordError", "<font color='red'>Please Enter minimum 8 characters</font>");
		} 
		
		if (emailId.trim().length() == 0) {
			isError = true;
			request.setAttribute("EmailError", "<font color='red'>Please Enter Email</font>");
		} 
		else 
		{
			request.setAttribute("EmailValue", emailId);
		}

		RequestDispatcher rd = null;
		
		if(password.equals("admin123") && emailId.equals("admin@gmail.com") )
		{
			System.out.println("Creating session");
			HttpSession session = request.getSession();
			session.setAttribute("isAdmin", true);
			rd = request.getRequestDispatcher("AdminHomeServlet");
		}
		else {
			System.out.println("Error going back to login");
			rd = request.getRequestDispatcher("AdminLogin.jsp");
		}
		rd.forward(request, response);
	}

}
