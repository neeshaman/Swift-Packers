package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SwiftPackers.bean.UserBean;
import com.SwiftPackers.dao.UserDao;

public class LoginServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");

    	UserBean userBean = new UserBean();
//		userBean =(UserBean) request.getAttribute("UserBean");

		boolean isError = false;
		boolean isAdmin = false;
		if (password.trim().length() == 0) {
			isError = true;
			request.setAttribute("PasswordError", "<font color='red'>Please Enter Password</font>");
		} else if (password.trim().length() < 8) {	
			isError = true;
			request.setAttribute("PasswordError", "<font color='red'>Please Enter minimum 8 characters</font>");
		} else {
			userBean.setUserPassword(password);
		}
		
		
		if (emailId.trim().length() == 0) {
			isError = true;
			request.setAttribute("EmailError", "<font color='red'>Please Enter Email</font>");
		} 
		else 
		{
			userBean.setUserEmail(emailId);
			request.setAttribute("EmailValue", emailId);
		}

		RequestDispatcher rd = null;
		
		if(password.equals("admin123") && emailId.equals("admin@gmail.com") )
		{
			System.out.println("Admin Login!");
			isAdmin = true;
			rd = request.getRequestDispatcher("AdminHomeServlet");
		}
		else	
		{
			UserDao userDao = new UserDao();
			userBean = userDao.authenticateUser(emailId, password);
			if(userBean==null)
			{
				isError=true;
				request.setAttribute("LoginError", "<font color='red'>Invalid login details,please try again.</font>");
			}
		}
		
		//RequestDispatcher rd = null;
		if (isError == true)
		{
			System.out.println("Error going back to login");
			rd = request.getRequestDispatcher("login.jsp");
		}
		else
		{
			HttpSession session = request.getSession();
			session.setAttribute("UserBean", userBean);
			if(isAdmin) {
				session.setAttribute("isAdmin", true);
				rd.forward(request,response);
			}
			
			if(!(userBean.getUserTypeId().equals("1"))) {
				rd = request.getRequestDispatcher("UserHome.jsp");
			}
		}
		rd.forward(request,response);
	}
}