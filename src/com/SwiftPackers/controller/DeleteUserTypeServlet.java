package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.dao.UserDao;
import com.SwiftPackers.dao.UserTypeDao;

public class DeleteUserTypeServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userTypeId = request.getParameter("userTypeId");

		UserTypeDao dao = new UserTypeDao();
		if (dao.deleteUserType(userTypeId)) {
			response.sendRedirect("ListUserTypeServlet");
		} else {
			response.sendRedirect("Error.jsp");
		}
	}
}
