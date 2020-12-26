package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.bean.ServiceBean;
import com.SwiftPackers.bean.UserBean;
import com.SwiftPackers.bean.UserTypeBean;
import com.SwiftPackers.dao.ServiceDao;
import com.SwiftPackers.dao.UserDao;
import com.SwiftPackers.dao.UserTypeDao;

public class EditServiceServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String serviceId = request.getParameter("serviceId");

		ServiceDao dao = new ServiceDao();

		ServiceBean bean = dao.getDataByPk(serviceId);
		RequestDispatcher rd = null;
		if (bean == null)
		{
			rd = request.getRequestDispatcher("Error.jsp");
		}
		else
		{
			rd = request.getRequestDispatcher("EditService.jsp");
			request.setAttribute("ServiceBean", bean);
		}
		rd.forward(request, response);
	}
}
