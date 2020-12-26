package com.SwiftPackers.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.bean.ServiceBean;
import com.SwiftPackers.bean.UserTypeBean;
import com.SwiftPackers.dao.ServiceDao;
import com.SwiftPackers.dao.UserTypeDao;

public class ListServiceServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServiceDao dao = new ServiceDao();

		ArrayList<ServiceBean> list = dao.listService();
		
		request.setAttribute("ServiceList", list);
		request.getRequestDispatcher("ListService.jsp").forward(request, response);
	}
}