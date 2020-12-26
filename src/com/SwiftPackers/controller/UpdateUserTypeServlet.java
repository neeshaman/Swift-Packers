package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.bean.UserTypeBean;
import com.SwiftPackers.dao.UserTypeDao;

public class UpdateUserTypeServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String userTypeId=request.getParameter("userTypeId");
		String userTypeName = request.getParameter("userTypeName");
		
		UserTypeBean bean = new UserTypeBean();

		boolean isError = false;

		bean.setUserTypeId(userTypeId);
		
		if (userTypeName.trim().length() == 0) {
			isError = true;
			request.setAttribute("UserTypeNameError", "<font color='red'>Please Enter User type</font>");
		}
		else 
		{ 
			int flag=0;
			for(int i=0;i<userTypeName.trim().length();i++)
			{    
				if( (userTypeName.charAt(i)>=33 && userTypeName.charAt(i)<=64) || (userTypeName.charAt(i)>=91 && userTypeName.charAt(i)<=96 ) || (userTypeName.charAt(i)>=123 && userTypeName.charAt(i)<=127 ) )
				{	
					isError = true;
					request.setAttribute("UserTypeNameError", "<font color='red'>Please Enter valid user type</font>");
					flag=1;
					break;
				}
			}
				
			if(flag==0)
			{
				bean.setUserTypeName(userTypeName);
				request.setAttribute("UserTypeValue", userTypeName);
			}
		}
		
		RequestDispatcher rd = null;
		if (isError == true) 
		{
			request.setAttribute("UserTypeBean", bean);
			rd = request.getRequestDispatcher("EditUserType.jsp");
		} 
		else
		{
			UserTypeDao dao = new UserTypeDao();
			if (dao.updateUserType(bean)) {
				rd = request.getRequestDispatcher("ListUserTypeServlet");
			} 
			else
			{
				rd = request.getRequestDispatcher("Error.jsp");
			}
		}
		rd.forward(request, response);

	}
}
